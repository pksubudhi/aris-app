import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required to ensure Widget framwork is binded to Flutter Engine. This is essential to do BEFORE we access functions that precede RunApp (in this case portrait lock function).
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}
