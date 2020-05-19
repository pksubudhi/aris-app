import 'package:flutter/material.dart';
import '../styles.dart';

class DefaultAppBar extends AppBar {

  @override
  final IconThemeData iconTheme = IconThemeData (color: Colors.white);

  @override
  final brightness = Brightness.dark;

  @override
  final Color backgroundColor = Styles.pageBackground;

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 0.5;
}