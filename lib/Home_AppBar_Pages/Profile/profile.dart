import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';
import '../../components/home_bottom_nav_bar.dart';

class Profile extends StatefulWidget {
  @override
  createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0; // bottom nav bar

  @override
  Widget build(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Scaffold(
        backgroundColor: Styles.pageBackground,
        appBar: HomeAppBar(
          title: Text('Profile', style: Styles.title),
        ),
        body: _bottomBarNavigate(context, _currentIndex),
        bottomNavigationBar: HomeBottomNavBar(
          currentIndex: _currentIndex,
          iconSize: 40.0 * sizeScale,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered),
                title: Text('Activity', textScaleFactor: sizeScale)),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                title: Text('Stats', textScaleFactor: sizeScale)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Info', textScaleFactor: sizeScale)),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(index);
              _bottomBarNavigate(context, index);
            });
          },
        ));
  }

  _bottomBarNavigate(BuildContext context, int navSelect) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    switch (navSelect) {
      case 0:
        {
          return SizedBox(
              height: Styles.displayHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: heightScale * 24),
                  _profileName(context),
                  SizedBox(height: heightScale * 50),
                  _profileWorkout(context),
                  SizedBox(height: heightScale * 23),
                  _profileRehab(context),
                  SizedBox(height: heightScale * 23),
                  _profileSport(context),
                ],
              ));
        }
        break;
      case 1:
        {
          return SizedBox(
              height: Styles.displayHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: heightScale * 24),
                  _profileName(context),
                  SizedBox(height: heightScale * 50),
                  _profileStats(context),
                ],
              ));
        }
        break;
      case 2:
        {
          return SizedBox(
              height: Styles.displayHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: heightScale * 24),
                  _profileName(context),
                  SizedBox(height: heightScale * 50),
                  _profileInfo(context),
                ],
              ));
        }
        break;

      default:
        {
          // statement
        }
        break;
    }
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

  Widget _profileWorkout(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _colorBox(Styles.arisGreen, 'Workout', 'March 10'),
        _bodyBox(
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
        _bodyBox(
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
        _bodyBox(
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

  Widget _bodyBox(Icon icon, Icon details, String status) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
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
        ],
      ),
    );
  }

  Widget _profileStats(context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeScale * 30),
              color: Styles.arisBlue),
          constraints: BoxConstraints(
              maxHeight: heightScale * 100, maxWidth: widthScale * 200),
          child: Align(
            alignment: Alignment.center,
            child: RichText(
              textScaleFactor: sizeScale,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Games Played\n', style: Styles.infoWhite),
                  TextSpan(text: '24', style: Styles.homeTitles),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: heightScale * 50),
        _profileInfoSection('Playing time'),
        SizedBox(height: heightScale * 12),
        _profileInfoBar(0.90),
        SizedBox(height: heightScale * 24),
        _profileInfoSection('Resting time'),
        SizedBox(height: heightScale * 12),
        _profileInfoBar(0.50),
        SizedBox(height: heightScale * 24),
        _profileInfoSection('Cumulative force absorbed (Kg):'),
        Text ('200 Kg', style: Styles.infoWhite, textScaleFactor: sizeScale),
        SizedBox(height: heightScale * 12),
        _profileInfoBar(0.60),
        SizedBox(height: heightScale * 24),
        _profileInfoSection('Force threshold exceeded per game:'),
        Text ('2 times', style: Styles.infoWhite, textScaleFactor: sizeScale),
        SizedBox(height: heightScale * 12),
        _profileInfoBar(0.20),
      ],
    );
  }

  Widget _profileInfoSection(String section) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Text(section, style: Styles.infoWhite, textScaleFactor: sizeScale);
  }

  Widget _profileInfoBar(double rating) {
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    double ratingScale = 1 - rating;
    return Stack(
      children: [
        Align(
          alignment: Alignment(0.5, 0),
          child: Container(
            constraints: BoxConstraints(maxWidth: widthScale * 300),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Styles.logoLine,
                stops: Styles.stops,
                end: Alignment.centerRight,
                begin: Alignment.centerLeft,
              ),
            ),
            height: heightScale * 10,
          ),
        ),
        Align(
          alignment: Alignment(1, 0),
          child: Container(
            width: widthScale * 329 * ratingScale,
            color: Styles.pageBackground,
            height: heightScale * 10,
          ),
        ),
      ],
    );
  }

  Widget _profileInfo(context) {
    return Column();
  }
}
