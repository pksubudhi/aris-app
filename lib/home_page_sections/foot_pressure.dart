import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';
import 'package:arisapp/home_appbar_pages/leading/bluetooth/backgroundcollectedpage.dart';
import 'package:arisapp/home_appbar_pages/leading/bluetooth/backgroundcollectingtask.dart';
import 'package:scoped_model/scoped_model.dart';

class FootPressure extends StatefulWidget {
  @override
  createState() => _FootPressureState();
}

class _FootPressureState extends State<FootPressure> {
  BackgroundCollectingTask _collectingTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: DefaultAppBar(),
      body: Container(
          child: RaisedButton(
            color: Colors.pinkAccent,
            textColor: Colors.white,
        disabledTextColor: Colors.white,
        disabledColor: Colors.blueGrey,
        child: Text('View background collected data'),
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
      )),
      /*   SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/pressure_page_demo.png'),
        ),
      ),*/
    );
  }
}
