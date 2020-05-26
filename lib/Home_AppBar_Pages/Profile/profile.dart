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
    double heightScale = Styles.displayHeight(context) / 896;

    return Scaffold(
        backgroundColor: Styles.pageBackground,
        appBar: HomeAppBar(
          title: Text('Profile', style: Styles.title),
        ),
        body: SizedBox(
            height: Styles.displayHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: heightScale * 24),
                _profileName(context),
                SizedBox(height: heightScale * 45),
                _profileNavTab(context),
                SizedBox(height: heightScale * 33),
                _profileWorkout(context),
                SizedBox(height: heightScale * 23),
                _profileRehab(context),
                SizedBox(height: heightScale * 23),
                _profileSport(context),
              ],
            )));
  }

  Widget _profileName(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.account_circle,
            color: Styles.homeBlue, size: 80.0 * sizeScale),
        Text(
          "Lebron James",
          style: Styles.title,
          textScaleFactor: sizeScale,
        )
      ],
    );
  }

  Widget _profileNavTab(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Activity",
            style: Styles.subTitleUnderlined, textScaleFactor: sizeScale),
        Text("Stats", style: Styles.subTitle, textScaleFactor: sizeScale),
        Text("Info", style: Styles.subTitle, textScaleFactor: sizeScale)
      ],
    );
  }

  Widget _profileWorkout(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _colorBox(Styles.arisGreen, 'Workout', 'March 10'),
        _greyBox(
            Icon(Icons.directions_run,
                size: sizeScale * 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline,
                size: sizeScale * 40.0, color: Styles.arisGreen),
            'Running'),
      ],
    );
  }

  Widget _profileRehab(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _colorBox(Styles.arisBlue, 'Rehab', 'March 1'),
        _greyBox(
            Icon(Icons.favorite_border,
                size: sizeScale * 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline,
                size: sizeScale * 40.0, color: Styles.arisBlue),
            'Recovery'),
      ],
    );
  }

  Widget _profileSport(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _colorBox(Styles.arisBlack, 'Sport', 'March 21'),
        _greyBox(
            Icon(Icons.tonality,
                size: sizeScale * 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline,
                size: sizeScale * 40.0, color: Styles.arisBlack),
            'Basketball'),
      ],
    );
  }

  Widget _colorBox(Color color, String label, String date) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sizeScale * 30),
              topRight: Radius.circular(sizeScale * 30))),
      margin: EdgeInsets.fromLTRB(sizeScale * 20.0, 0, sizeScale * 20.0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(label, style: Styles.homeTitles, textScaleFactor: sizeScale),
            Text(date, style: Styles.infoWhiteS, textScaleFactor: sizeScale),
          ]),
    );
  }

  Widget _greyBox(Icon icon, Icon details, String status) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Container(
      color: Styles.pageBackground,
      margin: EdgeInsets.fromLTRB(0, sizeScale * 50.0, 0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            details,
            Text(status,
                style: Styles.homeTitles,
                textAlign: TextAlign.end,
                textScaleFactor: sizeScale),
          ]),
    );
  }
}
