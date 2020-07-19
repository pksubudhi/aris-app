//import 'package:arisapp/Home_AppBar_Pages/Title/profile.dart';
//import 'package:arisapp/home_page.dart';
import 'package:arisapp/home_appbar_pages/leading/bluetooth/backgroundcollectingtask-providertest.dart';
import 'package:provider/provider.dart';

import 'package:arisapp/login_page.dart';
import 'package:flutter/material.dart';
import 'home_appbar_pages/leading/bluetooth/bluetooth.dart';
import 'home_page.dart';


class App extends StatelessWidget {
  final BackgroundCollectingTask model = BackgroundCollectingTask();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<DataSample>.value(
          value: model.sampleStream
        ),
        Provider<BackgroundCollectingTask>.value(
          value:model
        )
      ],
      child: MaterialApp(
          home:HomePage()
      ),
    );
  }
}
