import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';

class FootPressure extends StatefulWidget {
  @override
  createState() => _FootPressureState();
}

class _FootPressureState extends State<FootPressure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/pressure_page_demo.png'),
        ),
      ),
    );
  }
}
