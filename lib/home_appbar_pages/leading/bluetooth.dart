import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';

class Bluetooth extends StatefulWidget {
  @override
  createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: HomeAppBar(
        title: Text('Bluetooth', style: Styles.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BTwritten(context),
//          _BTvisual(context),
//          _BTstatus(context),
        ],
      ),
    );
  }

  Widget _BTwritten(context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Container(
        margin: EdgeInsets.fromLTRB(widthScale * 40, 0, widthScale * 40, 0),
        constraints: BoxConstraints.expand(height: heightScale * 180),
//        decoration: BoxDecoration(color: Styles.arisGreen),
        child: Stack(
          children: [
            alignLeftRight(-0.98, -0.8, 'R'),
            alignLeftRight(0.95, -0.8, 'L'),
            alignConnection(-1.0, 0, Icons.brightness_1, Colors.grey),
            alignConnection(-1.0, 0.5, Icons.brightness_1, Colors.grey),
            alignConnection(-1.0, 1.0, Icons.brightness_1, Colors.grey),
            alignConnection(1.0, 0, Icons.brightness_1, Styles.arisBlue),
            alignConnection(1.0, 0.5, Icons.brightness_1, Colors.grey),
            alignConnection(1.0, 1.0, Icons.brightness_1, Colors.grey),
            alignDeviceID(-0.05, 0, 'ARISE Sock'),
            alignDeviceID(-0.08, 0.5, 'ARISE Shin'),
            alignDeviceID(0, 1.0, 'ARISE Thigh'),
          ],
        ));
  }

/*Widget BTvisual(context){

  }
  Widget BTstatus(context){

  }*/

  Widget alignLeftRight(double x, double y, String text) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Text(text, style: Styles.title, textScaleFactor: sizeScale));
  }

  Widget alignConnection(double x, double y, icon, Color color) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Icon(icon, color: color, size: 35 * sizeScale));
  }

  Widget alignDeviceID(double x, double y, String text) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child:
        Text(text, style: Styles.infoWhitesub, textScaleFactor: sizeScale));
  }
}
