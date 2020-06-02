import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';

class Activity extends StatefulWidget {
  @override
  createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/activity_page_demo.png'),
        ),
      ),
    );
  }
}