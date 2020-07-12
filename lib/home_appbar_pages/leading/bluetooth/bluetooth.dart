import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:arisapp/components/home_app_bar.dart';
import '../../../styles.dart';
import './SelectBondedDevicePage.dart';
import './BackgroundCollectingTask.dart';
import './BackgroundCollectedPage.dart';

//@TODO get rid of useless libraries
//import './DiscoveryPage.dart';
//import './ChatPage.dart';
//import 'helpers/linechart.dart';
//import 'helpers/paintstyle.dart';

class Bluetooth extends StatefulWidget {
//  Bluetooth({
//    Key key,
//  }) : super(key: key);

  @override
  createState() => _BluetoothState();
}

class _DeviceWithAvailability extends BluetoothDevice {
  BluetoothDevice device;
  int rssi;

  _DeviceWithAvailability(this.device, [this.rssi]);
}

enum _DeviceAvailability {
  maybe,
  yes,
}
//final Key keyUIStateBT = PageStorageKey('UIStateBT'); //@TODO maybe make global

class _BluetoothState extends State<Bluetooth> {
  List<BluetoothDevice> devices = List<BluetoothDevice>();

  //@ TODO Below code may be useless.
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  String _address = "...";
  String _name = "...";
  StreamSubscription<BluetoothDiscoveryResult> _discoveryStreamSubscription;
  bool _isDiscovering;

//@TODO Maintain state when user exits the bluetooth page and re-enters it (via "provider" app state management)

  bool sockRTapped = false;
  bool sockLTapped = false;
  bool shinRTapped = false;
  bool shinLTapped = false;
  bool thighRTapped = false;
  bool thighLTapped = false;
  Timer _discoverableTimeoutTimer;
  BackgroundCollectingTask _collectingTask;
  bool _autoAcceptPairingRequests = true;

  //@TODO we want the above to always be true for everyone using ARISE App, so they don't have to enter the pin.

  @override
  void initState() {
    super.initState();

    //@TODO Below code may be useless.
//     Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
//        _bluetoothState = state;//Discoverable mode is disabled when Bluetooth gets disabled
        _discoverableTimeoutTimer = null;
//        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
//    _collectingTask?.dispose();
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: HomeAppBar(title: Text('Bluetooth', style: Styles.title)),
      body: SizedBox(
        height: Styles.displayHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _writtenBT(context),
            SizedBox(height: heightScale * 10),
            _visualBT(context),
          ],
        ),
      ),
    );
  }

  Widget _writtenBT(context) {
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Container(
        margin: EdgeInsets.fromLTRB(widthScale * 40, 0, widthScale * 40, 0),
        constraints: BoxConstraints.expand(height: heightScale * 240),
//        decoration: BoxDecoration(color: Colors.amber),
        child: Stack(
          children: [
            alignLeftRight(-0.98, -0.9, 'R'),
            alignLeftRight(0.95, -0.9, 'L'),
            sockR(-1.0, -0.3),
            shinR(-1.0, 0.3),
            thighR(-1.0, 0.9),
            sockL(1.0, -0.3),
            shinL(1.0, 0.3),
            thighL(1.0, 0.9),
            alignDeviceID(-0.05, -0.3, 'ARISE Sock'),
            alignDeviceID(-0.08, 0.3, 'ARISE Shin'),
            alignDeviceID(0, 0.9, 'ARISE Thigh'),
          ],
        ));
  }

  Widget _visualBT(context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Container(
      constraints: BoxConstraints(maxHeight: heightScale * 500),
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/male_cartoon.png',
                  // @TODO in case of a female user, it would change to female cartoon image.
                  fit: BoxFit.contain)),
          thighR(-0.145, 0.25),
          shinR(-0.16, 0.6),
          sockR(-0.14, 0.95),
          thighL(0.14, 0.25),
          shinL(0.15, 0.6),
          sockL(0.14, 0.95),
        ]),
      ),
    );
  }

  Widget alignLeftRight(double x, double y, String text) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Text(text, style: Styles.title, textScaleFactor: sizeScale));
  }

  Widget alignDeviceID(double x, double y, String text) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child:
            Text(text, style: Styles.infoWhitesub, textScaleFactor: sizeScale));
  }

  Widget sockR(double x, double y) {
    return GestureDetector(
      onTap: () {
        sockRTapped = !sockRTapped;
        setState(() {});
      },
      child: sockRTapped ? charts(context) : noConnection(x, y),
    );
  }

  Widget sockL(double x, double y) {
    return GestureDetector(
      onTap: () {
        sockLTapped = !sockLTapped;
        setState(() {});
      },
      child: sockLTapped ? connectingLeftAriseMkI(x, y) : noConnection(x, y),
    );
  }

  Widget shinR(double x, double y) {
    return GestureDetector(
      onTap: () {
        shinRTapped = !shinRTapped;
        setState(() {});
      },
      child: shinRTapped ? connecting(x, y) : noConnection(x, y),
    );
  }

  Widget shinL(double x, double y) {
    return GestureDetector(
      onTap: () {
        shinLTapped = !shinLTapped;
        setState(() {});
      },
      child: shinLTapped ? connecting(x, y) : noConnection(x, y),
    );
  }

  Widget thighR(double x, double y) {
    return GestureDetector(
      onTap: () {
        thighRTapped = !thighRTapped;
        setState(() {});
      },
      child: thighRTapped ? connecting(x, y) : noConnection(x, y),
    );
  }

  Widget thighL(double x, double y) {
    return GestureDetector(
      onTap: () {
        thighLTapped = !thighLTapped;
        setState(() {});
      },
      child: thighLTapped ? connecting(x, y) : noConnection(x, y),
    );
  }

//  connecting(double x, double y) {
//    loadconnecting(x, y);
//    Timer(Duration(milliseconds: 3000), () {
//      connected(x, y);
//    });
//  }
  Widget noConnection(double x, double y) {
    return statusOfConnection(x, y, Icons.check_box_outline_blank, Colors.grey);
  }

  Widget connecting(double x, double y) {
    return statusOfConnection(x, y, Icons.bluetooth_searching, Styles.arisBlue);
  }

  Widget connected(double x, double y) {
    //@TODO Implement this for when bluetooth successfully connects
    return statusOfConnection(x, y, Icons.check, Styles.arisGreen);
  }

  Widget statusOfConnection(double x, double y, IconData icon, Color color) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
      alignment: Alignment(x, y),
      child: Icon(icon, color: color, size: 40 * sizeScale),
    );
  }

  Widget connectingLeftAriseMkI(double x, double y) {
    return GestureDetector(
      // connect state = grey box, disconnect state = green check-mark
      child: ((_collectingTask != null && _collectingTask.inProgress)
          ? connected(x, y)
          : noConnection(x, y)),
      onTap: () async {
        // change disconnect functionality to onForcePressEnd
        if (_collectingTask != null && _collectingTask.inProgress) {
          await _collectingTask.cancel();
          setState(() {
//       Update for `_collectingTask.inProgress`
          });
        } else {
          //@TODO, possible to use MAC address for instant connection? How about different ARISE units having different MAC addresses?
          /*final BluetoothDevice selectedDevice =
              await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SelectBondedDevicePage(checkAvailability: false);
              },
            ),
          );*/

          devices = await FlutterBluetoothSerial.instance.getBondedDevices();

          if ((devices.singleWhere((i) => i.address == "00:14:03:05:F2:5A",
                  orElse: () => null)) !=
              null) {
          } else {
            if (_autoAcceptPairingRequests) {
              FlutterBluetoothSerial.instance
                  .setPairingRequestHandler((BluetoothPairingRequest request) {
                print("Trying to auto-pair with Pin 1234");
                if (request.pairingVariant == PairingVariant.Pin) {
                  return Future.value("1234");
                }
                return null;
              });
            } else {
              FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
            }
            _startDiscovery();
          }

          BluetoothDevice selectedDevice;
          Iterator i = devices.iterator;
          while (i.moveNext()) {
            print(i.current.address.toString());
            if (i.current.address.toString() == "00:14:03:05:F2:5A") {
              selectedDevice = i.current;
              if (selectedDevice.isBonded) {
              } else {
                print("Bonding device");
                await FlutterBluetoothSerial.instance
                    .bondDeviceAtAddress(i.current.address.toString());
              }
            }
          }
          if (selectedDevice != null) {
            await _startBackgroundTask(context, selectedDevice);
            setState(() {
// Update for `_collectingTask.inProgress`
            });
          }
        }
      },
    );
  }

  void _startDiscovery() {
    _discoveryStreamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        devices.add(r.device);
      });
    });

    _discoveryStreamSubscription.onDone(() {
      setState(() {
        _isDiscovering = false;
      });
    });
  }

  //@TODO Below is the RAWChart window from old BT code
//  GestureDetector(
//              child: Icon(Icons.insert_chart,
//                  color: Colors.grey, size: 35 * sizeScale),
//              onTap: (_collectingTask != null)
//                  ? () {
//                      Navigator.of(context).push(
//                        MaterialPageRoute(
//                          builder: (context) {
//                            return ScopedModel<BackgroundCollectingTask>(
//                              model: _collectingTask,
//                              child: BackgroundCollectedPage(),
//                            );
//                          },
//                        ),
//                      );
//                    }
//                  : null,
//            ),

  // @TODO Below is chatbox code, may be useless.
//  void _startChat(BuildContext context, BluetoothDevice server) {
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (context) {
//          return ChatPage(server: server);
//        },
//      ),
//    );
//  }

  Future<void> _startBackgroundTask(
    BuildContext context,
    BluetoothDevice server,
  ) async {
    try {
      _collectingTask = await BackgroundCollectingTask.connect(server);
      await _collectingTask.start();
    } catch (ex) {
      if (_collectingTask != null) {
        _collectingTask.cancel();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error occured while connecting'),
            content: Text("${ex.toString()}"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget charts(context) {
    return RaisedButton(
      child: const Text('View background collected data'),
      onPressed: (_collectingTask != null)
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ScopedModel<BackgroundCollectingTask>(
                      model: _collectingTask,
                      child: BackgroundCollectedPage(),
                    );
                  },
                ),
              );
            }
          : null,
    );
  }
}
