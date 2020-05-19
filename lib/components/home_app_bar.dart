import 'package:flutter/material.dart';
import '../styles.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({Widget leading, List<Widget> actions})
      : super(leading: leading, actions: actions);

  @override
  final IconThemeData iconTheme =
      IconThemeData(color: Colors.white, size: 40.0);

  @override
  final Widget title =
      Icon(Icons.account_circle, color: Styles.arisBlue, size: 60.0);

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

/* ATTEMPTING TO BRING THE FOLLOWING CODE (leading & actions) FROM THE HOME_PAGE TO THIS HOME_APP_BAR.

leading: PopupMenuButton<Choice>(
shape: RoundedRectangleBorder(
side: BorderSide(color: Colors.grey),
borderRadius: BorderRadius.all(Radius.circular(20.0))),
padding: EdgeInsets.all(0.0),
icon: Icon(Icons.menu, size: 30.0),
color: Styles.pageBackground,
onSelected: _select,
itemBuilder: (BuildContext context) {
return choices.map((Choice menuSelect) {
return PopupMenuItem<Choice>(
value: menuSelect,
child: Column(children: [
Row(children: [
Icon(menuSelect.icon),
Spacer(flex: 1),
Text(menuSelect.title, style: Styles.infoWhite)
])
]));
}).toList();
},
),
actions: [
PopupMenuButton<Choice>(
shape: RoundedRectangleBorder(
side: BorderSide(color: Colors.grey),
borderRadius: BorderRadius.all(Radius.circular(20.0))),
icon: Icon(Icons.group_add, size: 40.0),
color: Styles.pageBackground,
onSelected: _accountSelect,
itemBuilder: (BuildContext context) {
return accounts.map((Choice accountSelect) {
return PopupMenuItem<Choice>(
value: accountSelect,
child: Column(children: [
Row(children: [
Icon(accountSelect.icon),
Spacer(flex: 1),
Text(accountSelect.title, style: Styles.infoWhite)
])
]));
}).toList();
},
),
],*/
