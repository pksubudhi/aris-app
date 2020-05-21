import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';

class Profile extends StatefulWidget {
  @override
  createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.pageBackground,
        appBar: HomeAppBar(
          title: Text('Profile', style: Styles.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Styles.displayHeight(context)*0.02),
            _profileName(context),
            SizedBox(height:Styles.displayHeight(context)*0.05),
            _profileNavTab(context),
            SizedBox(height: Styles.displayHeight(context)*0.037),
            _profileWorkout(context),
            SizedBox(height: Styles.displayHeight(context)*0.025),
            _profileRehab(context),
            SizedBox(height: Styles.displayHeight(context)*0.025),
            _profileSport(context),
          ],
        )));
  }

  Widget _profileName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.account_circle, color: Styles.homeBlue, size: 80.0),
        Text(
          "Lebron James",
          style: Styles.title,
        )
      ],
    );
  }

  Widget _profileNavTab(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Activity", style: Styles.subTitleUnderlined),
        Text("Stats", style: Styles.subTitle),
        Text("Info", style: Styles.subTitle)
      ],
    );
  }

  Widget _profileWorkout(context) {
    return Stack(
      children: [
        _colorBox(Styles.arisGreen, 'Workout', 'March 10'),
        _greyBox(
            Icon(Icons.directions_run, size: 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline, size: 40.0, color: Styles.arisGreen),
            'Running'),
      ],
    );
  }

  Widget _profileRehab(context) {
    return Stack(
      children: [
        _colorBox(Styles.arisBlue, 'Rehab', 'March 1'),
        _greyBox(
            Icon(Icons.favorite_border, size: 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline, size: 40.0, color: Styles.arisBlue),
            'Recovery'),
      ],
    );
  }

  Widget _profileSport(context) {
    return Stack(
      children: [
        _colorBox(Styles.arisBlack, 'Sport', 'March 21'),
        _greyBox(
            Icon(Icons.tonality, size: 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline, size: 40.0, color: Styles.arisBlack),
            'Basketball'),
      ],
    );
  }

  Widget _colorBox(Color color, String label, String date) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(label, style: Styles.homeTitles),
            Text(date, style: Styles.infoWhiteS),
          ]),
    );
  }

  Widget _greyBox(Icon icon, Icon details, String status) {
    return Container(
      color: Styles.pageBackground,
      margin: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            details,
            Text(status, style: Styles.homeTitles, textAlign: TextAlign.end),
          ]),
    );
  }

}
