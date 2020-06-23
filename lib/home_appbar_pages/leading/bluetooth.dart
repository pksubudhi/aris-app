import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';
//import 'dart:async';

class Bluetooth extends StatefulWidget {
  @override
  createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  bool sockRTapped = false;
  bool sockLTapped = false;
  bool shinRTapped = false;
  bool shinLTapped = false;
  bool thighRTapped = false;
  bool thighLTapped = false;
  bool connectingBT = false;

  @override
  Widget build(BuildContext context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: HomeAppBar(
        title: Text('Bluetooth', style: Styles.title),
      ),
      body: SizedBox(
        height: Styles.displayHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _writtenBT(context),
            SizedBox(height: heightScale * 50),
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
        constraints: BoxConstraints.expand(height: heightScale * 180),
        child: Stack(
          children: [
            alignLeftRight(-0.98, -0.8, 'R'),
            alignLeftRight(0.95, -0.8, 'L'),
            sockR(-1.0, 0),
            shinR(-1.0, 0.5),
            thighR(-1.0, 1.0),
            sockL(1.0, 0),
            shinL(1.0, 0.5),
            thighL(1.0, 1.0),
            alignDeviceID(-0.05, 0, 'ARISE Sock'),
            alignDeviceID(-0.08, 0.5, 'ARISE Shin'),
            alignDeviceID(0, 1.0, 'ARISE Thigh'),
          ],
        ));
  }

  Widget _visualBT(context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Container(
        constraints: BoxConstraints(maxHeight: heightScale * 500),
//    decoration: BoxDecoration(color: Colors.pinkAccent),
        child: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/male_cartoon.png',
                  // in case of female user, it would change to female cartoon image.
                  fit: BoxFit.contain)),
          thighR(-0.14, 0.25),
          shinR(-0.155, 0.6),
          sockR(-0.14, 0.95),
          thighL(0.135, 0.25),
          shinL(0.15, 0.6),
          sockL(0.14, 0.95),
        ]));
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
      child: sockRTapped ? loadingConnection(x, y) : noConnection(x, y),
    );
  }

  Widget sockL(double x, double y) {
    return GestureDetector(
      onTap: () {
        sockLTapped = !sockLTapped;
        setState(() {});
      },
      child: sockLTapped ? loadingConnection(x, y) : noConnection(x, y),
    );
  }

  Widget shinR(double x, double y) {
    return GestureDetector(
      onTap: () {
        shinRTapped = !shinRTapped;
        setState(() {});
      },
      child: shinRTapped ? loadingConnection(x, y) : noConnection(x, y),
    );
  }

  Widget shinL(double x, double y) {
    return GestureDetector(
      onTap: () {
        shinLTapped = !shinLTapped;
        setState(() {});
      },
      child: shinLTapped ? loadingConnection(x, y) : noConnection(x, y),
    );
  }

  Widget thighR(double x, double y) {
    return GestureDetector(
      onTap: () {
        thighRTapped = !thighRTapped;
        setState(() {});
      },
      child: thighRTapped ? loadingConnection(x, y) : noConnection(x, y),
    );
  }

  Widget thighL(double x, double y) {
    return GestureDetector(
      onTap: () {
        thighLTapped = !thighLTapped;
        setState(() {});
      },
      child: thighLTapped ? loadingConnection(x, y) : noConnection(x, y),
    );
  }

  Widget noConnection(double x, double y) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Icon(Icons.check_box_outline_blank,
            color: Colors.grey, size: 35 * sizeScale));
  }

  Widget loadingConnection(double x, double y) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Icon(Icons.brightness_1,
            color: Styles.arisBlue, size: 35 * sizeScale));
  }

  /*loadingConnection(double x, double y) async {
    setState(() => this.connectingBT = true);
    connecting(x, y);
    Timer(Duration(milliseconds: 3000), () async {
//    final location = await ____.fetchByID();
      setState(() {
        this.connectingBT = true;
        connected(x, y);
      });
      //});
    });
  }*/

  Widget connected(double x, double y) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child:
            Icon(Icons.check, color: Styles.arisGreen, size: 35 * sizeScale));
  }
}
