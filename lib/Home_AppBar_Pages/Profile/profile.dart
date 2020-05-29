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
            BottomNavigationBarItem( // index 0
                icon: Icon(Icons.format_list_numbered),
                title: Text('Activity', textScaleFactor: sizeScale)),
            BottomNavigationBarItem( // index 1
                icon: Icon(Icons.assessment),
                title: Text('Stats', textScaleFactor: sizeScale)),
            BottomNavigationBarItem( // index 2
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
    double heightScale = Styles.displayHeight(context) / 896;
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
                  SizedBox(height: heightScale * 40),
                  _activityWorkout(context),
                  SizedBox(height: heightScale * 30),
                  _activityRehab(context),
                  SizedBox(height: heightScale * 30),
                  _activitySport(context),
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
                  SizedBox(height: heightScale * 30),
                  _stats(context),
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
                  SizedBox(height: heightScale * 30),
                  _userDetails(context),
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

  Widget _activityWorkout(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _activityColorBox(Styles.arisGreen, 'Workout', 'March 10'),
        _activityBodyBox(
            Icon(Icons.directions_run,
                size: sizeScale * 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline,
                size: sizeScale * 40.0, color: Styles.arisGreen),
            'Running'),
      ],
    );
  }

  Widget _activityRehab(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _activityColorBox(Styles.arisBlue, 'Rehab', 'March 1'),
        _activityBodyBox(
            Icon(Icons.favorite_border,
                size: sizeScale * 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline,
                size: sizeScale * 40.0, color: Styles.arisBlue),
            'Recovery'),
      ],
    );
  }

  Widget _activitySport(context) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _activityColorBox(Styles.arisBlack, 'Sport', 'March 21'),
        _activityBodyBox(
            Icon(Icons.tonality,
                size: sizeScale * 100.0, color: Styles.textWhite),
            Icon(Icons.info_outline,
                size: sizeScale * 40.0, color: Styles.arisBlack),
            'Basketball'),
      ],
    );
  }

  Widget _activityColorBox(Color color, String label, String date) {
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

  Widget _activityBodyBox(Icon icon, Icon details, String status) {
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
        ],
      ),
    );
  }

  Widget _stats(context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizeScale * 50),
              color: Styles.arisBlue),
          constraints: BoxConstraints(
              maxHeight: heightScale * 80, maxWidth: widthScale * 200),
          child: Align(
            alignment: Alignment.center,
            child: RichText(
              textScaleFactor: sizeScale,
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Games Played\n', style: Styles.infoWhite),
                  TextSpan(text: '24', style: Styles.homeTitles),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: heightScale * 50),
        _statsInfoSection('Playing time per game:', '40 min', 0.9),
        SizedBox(height: heightScale * 50),
        _statsInfoSection('Resting time per game:', '10 min', 0.50),
        SizedBox(height: heightScale * 50),
        _statsInfoSection('Cumulative force absorbed (Kg):', '200 Kg', 0.75),
        SizedBox(height: heightScale * 50),
        _statsInfoSection(
            'Force threshold exceeded per game:', '9 Times', 0.90),
      ],
    );
  }

  Widget _statsInfoSection(String section, String value, double rating) {
    double widthScale = Styles.displayWidth(context) / 414;
    double sizeScale = Styles.screenSize(context) / 987;
    double pad = widthScale * 40;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(pad, 0, 0, 0),
          child: Text('$section\n$value',
              style: Styles.infoWhite,
              textAlign: TextAlign.left,
              textScaleFactor: sizeScale),
        ),
        _statsInfoBar(rating),
      ],
    );
  }

  Widget _statsInfoBar(double rating) {
    double heightScale = Styles.displayHeight(context) / 896;
    double ratingScale = 1 - rating;
    return Stack(
      children: [
        Container(
          height: heightScale * 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: Styles.logoLine,
              stops: Styles.stops,
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
            ),
          ),
        ),
        Align(
          alignment: Alignment(1, 0),
          child: Container(
            width: Styles.displayWidth(context) * ratingScale,
            color: Styles.pageBackground,
            height: heightScale * 10,
          ),
        ),
      ],
    );
  }

  Widget _userDetails(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _userData('Age', '35'),
        _userData('Gender', 'Male'),
        _userData('Height', '6ft 9in'),
        _userData('Weight', '250lb'),
        _userData('Sport', 'Basketball'),
        _userData('Injuries', '4 Click Here')
      ],
    );
  }

  Widget _userData(String label, String data) {
    double heightScale = Styles.displayHeight(context) / 896;
    double sizeScale = Styles.screenSize(context) / 987;
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment(-0.8, 0),
              child: Text(label,
                  style: Styles.infoWhite, textScaleFactor: sizeScale),
            ),
            Align(
              alignment: Alignment(0.8, 0),
              child: Text(data,
                  style: Styles.infoWhite,
                  textScaleFactor: sizeScale,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        SizedBox(height: heightScale * 30),
        Container(
          height: heightScale * 3,
          color: Styles.arisBlue,
        ),
        SizedBox(height: heightScale * 30),
      ],
    );
  }
}
