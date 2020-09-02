import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';

class RecoveryPage extends StatefulWidget {
  @override
  createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBackground,
     //  appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/recovery_page_demo.png'),
        ),
      ),
    );
  }
}