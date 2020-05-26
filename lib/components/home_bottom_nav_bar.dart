import 'package:flutter/material.dart';
import '../styles.dart';

class HomeBottomNavBar extends BottomNavigationBar {
  HomeBottomNavBar(
      {List<BottomNavigationBarItem> items,
      ValueChanged<int> onTap,
      int currentIndex, double iconSize})
      : super(items: items, onTap: onTap, currentIndex: currentIndex, iconSize: iconSize);

  @override
  final BottomNavigationBarType type = BottomNavigationBarType.fixed;

  @override
  final Color backgroundColor = Styles.arisBlack;

  @override
  final Color selectedItemColor = Styles.homeBlue;

  @override
  final Color unselectedItemColor = Styles.textWhite;

  @override
  final TextStyle selectedLabelStyle = Styles.loginHelp;

  @override
  final TextStyle unselectedLabelStyle = Styles.loginHelp;
}
