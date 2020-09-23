import 'dart:convert';
import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// fields for getting temperature detail from 6 sensors
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

class BackgroundCollectingTask {

  BluetoothConnection _connection; //class is from flutter_bluetooth_serial.dart
  List<int> _buffer;
  DataSample _sample;

  StreamController<DataSample> _sampleController;
  Stream<DataSample> get sampleStream => _sampleController.stream;

  // @TODO , Such sample collection in real code should be delegated
  // (via `Stream<DataSample>` preferably) and then saved for later
  // displaying on chart (or even stright prepare for displaying).
  // @TODO ? should be shrinked at some point, endless colleting data would cause memory shortage.
  List<String> dataList;
  var lineEndIndex;
  var lineStartIndex;

  bool inProgress;

  BackgroundCollectingTask(){
    inProgress = false;
    _sampleController = StreamController();
    _buffer = List<int>();
    _connection = null;
    dataList = List<String>();
    lineEndIndex = null;
    lineStartIndex = null;
  }

  _fromConnection() {
    _connection.input.listen((data) {
      inProgress = true;
      _buffer+=data;
      lineStartIndex = _buffer.lastIndexWhere((i) => (i>57 || i==0));
      if (lineStartIndex == -1){
      } else {
        _buffer.removeRange(0, lineStartIndex + 1);
      }
//      print(_buffer);
//      print("Buffer Length: " + (_buffer.length).toString());
      while (true) {
        lineEndIndex = _buffer.indexOf(10);
        if (lineEndIndex == -1) {
          break;
        } else {
          dataList =
              ascii.decode(_buffer.sublist(0, lineEndIndex + 1)).replaceAll(
                  "\n", "\t").trim().split("\t");
          print(dataList);
//          print("DataList Length: " + (dataList.length).toString());
          _buffer.removeRange(0, lineEndIndex + 1);
          if (dataList.length == 8) {
            changeSample();
            // If there is a sample, and it is full sent
          }
        }
      }
    }).onDone(() {
      inProgress = false;
    });
  }

  void changeSample(){
    _sample = DataSample(
        temperature1: (double.parse(dataList[0])),
        temperature2: (double.parse(dataList[1])),
        temperature3: (double.parse(dataList[2])),
        temperature4: (double.parse(dataList[3])),
        temperature5: (double.parse(dataList[4])),
        temperature6: (double.parse(dataList[5])),
        timestamp: DateTime.now());
    _sampleController.sink.add(_sample);
    print("updated sample");
  }

   Future<BackgroundCollectingTask> connect(
      BluetoothDevice server) async {
    _connection =
    await BluetoothConnection.toAddress(server.address);
    return _fromConnection();
  }

  void dispose() {
    _connection.dispose();
    _sampleController.close();
  }

  Future<void> start() async {
    inProgress = true;
  }

  Future<void> cancel() async {
    inProgress = false;
    await _connection.finish();
  }
}
