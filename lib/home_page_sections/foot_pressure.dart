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
    double heightScale = Styles.displayHeight(context) / 896;
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: DefaultAppBar(),
      body: Container(
        alignment: Alignment.center,
          child: RaisedButton(
            color: Styles.arisBlue,
            textColor: Colors.white,
            disabledTextColor: Colors.white,
            disabledColor: Colors.blueGrey,
            child: Text('Click to view incoming data', textAlign: TextAlign.center),
            onPressed:
            () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Column(
                          children: <Widget>[
                            Text(
                              'Sensor A:' + Provider
                                  .of<DataSample>(context).temperature1
                                  .toString(),
                              style:  Styles.infoWhite,
                            ),
                            Container(
                              height: heightScale * 3,
                              color: Styles.arisBlue,
                            ),
                            Text(
                              'Sensor B:' + Provider
                                  .of<DataSample>(context).temperature2
                                  .toString(),
                              style:  Styles.infoWhite,
                            ),
                            Container(
                              height: heightScale * 3,
                              color: Styles.arisBlue,
                            ),
                            Text(
                              'Sensor C:' + Provider
                                  .of<DataSample>(context).temperature3
                                  .toString(),
                              style:
                                Styles.infoWhite,
                            ),
                            Container(
                              height: heightScale * 3,
                              color: Styles.arisBlue,
                            ),
                            Text(
                              'Sensor D:' + Provider
                                  .of<DataSample>(context).temperature4
                                  .toString(),
                              style:  Styles.infoWhite,
                            ),
                            Container(
                              height: heightScale * 3,
                              color: Styles.arisBlue,
                            ),
                            Text(
                              'Sensor E:' + Provider
                                  .of<DataSample>(context).temperature5
                                  .toString(),
                              style:  Styles.infoWhite,
                            ),
                            Container(
                              height: heightScale * 3,
                              color: Styles.arisBlue,
                            ),
                            Text(
                              'Sensor F:' + Provider
                                  .of<DataSample>(context).temperature6
                                  .toString(),
                              style:  Styles.infoWhite,
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
