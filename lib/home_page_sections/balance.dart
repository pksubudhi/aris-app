import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';

class Balance extends StatefulWidget {
  @override
  createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: DefaultAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/balance_page_demo.png'),
        ),
      ),
    );
  }
}