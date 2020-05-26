import 'package:flutter/material.dart';
import '../styles.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({Widget title, Widget leading, List<Widget> actions})
      : super(title: title, leading: leading, actions: actions);

  @override
  final brightness = Brightness.dark;

  @override
  final Color backgroundColor = Styles.arisBlack;

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 0.5;
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Device\nSettings', icon: Icons.settings),
  const Choice(title: 'Account', icon: Icons.person),
  const Choice(title: 'Sync', icon: Icons.sync),
  const Choice(title: 'Log out', icon: Icons.exit_to_app),
];

const List<Choice> accounts = const <Choice>[
  const Choice(title: 'James', icon: Icons.account_circle),
  const Choice(title: 'Kobe', icon: Icons.account_circle),
  const Choice(title: 'Har_en', icon: Icons.account_circle),
  const Choice(title: 'Add Profile', icon: Icons.person_add),
];

//LATER, ATTEMPT TO BRING THE CODE (leading & actions) FROM THE HOME_PAGE TO THIS HOME_APP_BAR.
