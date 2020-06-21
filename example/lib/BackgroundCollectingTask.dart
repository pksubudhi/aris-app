import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:scoped_model/scoped_model.dart';

class DataSample {
  double temperature1;
  double temperature2;
  double temperature3;
  double temperature4;
  double temperature5;
  double temperature6;
  double temperature7;
  double temperature8;




  DateTime timestamp;

  DataSample({
    this.temperature1,
    this.temperature2,
    this.temperature3,
    this.temperature4,
    this.temperature5,
    this.temperature6,
    this.temperature7,
    this.temperature8,

    this.timestamp,
  });
}

class BackgroundCollectingTask extends Model {
  static BackgroundCollectingTask of(
    BuildContext context, {
    bool rebuildOnChange = false,
  }) =>
      ScopedModel.of<BackgroundCollectingTask>(
        context,
        rebuildOnChange: rebuildOnChange,
      );

  final BluetoothConnection _connection;
  List<int> _buffer = List<int>();

  // @TODO , Such sample collection in real code should be delegated
  // (via `Stream<DataSample>` preferably) and then saved for later
  // displaying on chart (or even stright prepare for displaying).
  // @TODO ? should be shrinked at some point, endless colleting data would cause memory shortage.
  List<DataSample> samples = List<DataSample>();
  List<String> dataList = List<String>();
  var lineEndIndex;

  bool inProgress;

  BackgroundCollectingTask._fromConnection(this._connection) {
    _connection.input.listen((data) {
      _buffer+=data;
      print(_buffer);
      print("Buffer Length: " + (_buffer.length).toString());
      while (true) {
        lineEndIndex = _buffer.indexOf(10);
        if (lineEndIndex == -1) {
          break;
        } else {
          dataList =
              ascii.decode(_buffer.sublist(0, lineEndIndex + 1)).replaceAll(
                  "\n", "\t").trim().split("\t");
          print(dataList);
          print("DataList Length: " + (dataList.length).toString());
          _buffer.removeRange(0, lineEndIndex + 1);
          if (dataList.length == 8) {
            // If there is a sample, and it is full sent
            //        _buffer = ascii.decode(data.trim().split(" ");
            final DataSample sample = DataSample(
                temperature1: (double.parse(dataList[0])),
                temperature2: (double.parse(dataList[1])),
                temperature3: (double.parse(dataList[2])),
                temperature4: (double.parse(dataList[3])),
                temperature5: (double.parse(dataList[4])),
                temperature6: (double.parse(dataList[5])),
                timestamp: DateTime.now());
            samples.add(sample);
            //print("${sample.timestamp.toString()} -> ${sample.temperature1} / ${sample.temperature2}");
          }
        }
      }
    }).onDone(() {
      inProgress = false;
      notifyListeners();
    });
  }

  static Future<BackgroundCollectingTask> connect(
      BluetoothDevice server) async {
    final BluetoothConnection connection =
        await BluetoothConnection.toAddress(server.address);
    return BackgroundCollectingTask._fromConnection(connection);
  }

  void dispose() {
    _connection.dispose();
  }

  Future<void> start() async {
    inProgress = true;
    _buffer.clear();
    samples.clear();
    notifyListeners();
    _connection.output.add(ascii.encode('start'));
    await _connection.output.allSent;
  }

  Future<void> cancel() async {
    inProgress = false;
    notifyListeners();
    _connection.output.add(ascii.encode('stop'));
    await _connection.finish();
  }

  Future<void> pause() async {
    inProgress = false;
    notifyListeners();
    _connection.output.add(ascii.encode('stop'));
    await _connection.output.allSent;
  }

  Future<void> reasume() async {
    inProgress = true;
    notifyListeners();
    _connection.output.add(ascii.encode('start'));
    await _connection.output.allSent;
  }

  Iterable<DataSample> getLastOf(Duration duration) {
    DateTime startingTime = DateTime.now().subtract(duration);
    int i = samples.length;
    do {
      i -= 1;
      if (i <= 0) {
        break;
      }
    } while (samples[i].timestamp.isAfter(startingTime));
    return samples.getRange(i, samples.length);
  }
}
