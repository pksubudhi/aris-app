import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import 'package:arisapp/home_appbar_pages/leading/bluetooth/backgroundcollectedpage.dart';
import 'package:arisapp/home_appbar_pages/leading/bluetooth/backgroundcollectingtask-providertest.dart';
import 'package:scoped_model/scoped_model.dart';

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
      body: Container(
          child: RaisedButton(
            color: Colors.pinkAccent,
            textColor: Colors.white,
            disabledTextColor: Colors.white,
            disabledColor: Colors.blueGrey,
            child: Text('View background collected data'),
            onPressed:
            () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Column(
                          children: <Widget>[
                            Text(
                              'Listening a value :' + Provider
                                  .of<DataSample>(context)
                                  .temperature1
                                  .toString(),
                              style: TextStyle(
                                  color:Colors.white
                              ),
                            ),
                            Text(
                              'Listening a value :' + Provider
                                  .of<DataSample>(context)
                                  .temperature2
                                  .toString(),
                              style: TextStyle(
                                  color:Colors.white
                              ),
                            ),
                            Text(
                              'Listening a value :' + Provider
                                  .of<DataSample>(context)
                                  .temperature2
                                  .toString(),
                              style: TextStyle(
                                  color:Colors.white
                              ),
                            ),
                          ]
                      );
                    },
                  ),
                );
              }
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
