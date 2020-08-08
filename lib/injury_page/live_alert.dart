import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../styles.dart';

class LiveAlert extends StatefulWidget {
  @override
  createState() => _LiveAlertState();
}

class _LiveAlertState extends State<LiveAlert> {
  int _currentIndex = 0; // bottom nav bar

  @override
  Widget build(BuildContext context) {
//    double sizeScale = Styles.screenSize(context) / 987;

    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: HomeAppBar(
        title: Text('Live Alert', style: Styles.title),
      ),
      body: _bottomBarNavigate(context, _currentIndex),
      // bottomNavigationBar: HomeBottomNavBar(
      //   currentIndex: _currentIndex,
      //   iconSize: 40.0 * sizeScale,
      //   items: [
      //     BottomNavigationBarItem( // index 0
      //         icon: Icon(Icons.format_list_numbered),
      //         title: Text('Activity', textScaleFactor: sizeScale)),
      //     BottomNavigationBarItem( // index 1
      //         icon: Icon(Icons.assessment),
      //         title: Text('Stats', textScaleFactor: sizeScale)),
      //     BottomNavigationBarItem( // index 2
      //         icon: Icon(Icons.account_circle),
      //         title: Text('Info', textScaleFactor: sizeScale)),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //       print(index);
      //       _bottomBarNavigate(context, index);
      //     });
      //   },
      // )
    );
  }

  _bottomBarNavigate(BuildContext context, int navSelect) {
//    double heightScale = Styles.displayHeight(context) / 896;
    return  ListView(
      children: [
        // _profileName(context),
        Container(
          height: 10,
        ),
        _activityWorkout(context),
        Container(
          height: 20,
        ),
        _activityRehab(context),
        Container(
          height: 20,
        ),
        _activitySport(context),
      ],
    );
  }

  // Widget _profileName(BuildContext context) {
  //   double sizeScale = Styles.screenSize(context) / 987;

  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(Icons.account_circle,
  //           color: Styles.homeBlue, size: 80.0 * sizeScale),
  //       Text(
  //         "Lebron James",
  //         style: Styles.title,
  //         textScaleFactor: sizeScale,
  //       )
  //     ],
  //   );
  // }

  Widget _activityWorkout(context) {
//    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _activityColorBox(Styles.lightGrey, '    Activity Info'),
        _activityBodyBox('   Basketball'),
      ],
    );
  }

  Widget _activityRehab(context) {
//    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _warningColorBox(
          Styles.alertRed,
          'Warning! Player(s) run risk of lower limb injury',
        ),
        //Warning! Player(s) run risk of lower limb injury
      ],
    );
  }

  Widget _activitySport(context) {
//    double sizeScale = Styles.screenSize(context) / 987;

    return Stack(
      children: [
        _playerColorBox(
            Styles.lightGrey, '        Player                          Risk'),
        Stack(
          children: [
            _playerBodyBox(context),
          ],
        ),
      ],
    );
  }

  Widget _activityColorBox(
    Color color,
    String label,
  ) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sizeScale * 30),
              topRight: Radius.circular(sizeScale * 30))),
      margin: EdgeInsets.fromLTRB(sizeScale * 20.0, 0, sizeScale * 20.0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: Styles.homeTitles, textScaleFactor: sizeScale),
          ]),
      height: 60,
    );
  }

  Widget _warningColorBox(
    Color color,
    String label,
  ) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(sizeScale * 30),
      ),
      margin: EdgeInsets.fromLTRB(sizeScale * 50.0, 0, sizeScale * 50.0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                label,
                style: Styles.homeTitles,
                textAlign: TextAlign.center,
                textScaleFactor: sizeScale,
                softWrap: true,
              ),
            )
          ]),
      height: 118,
    );
  }

  Widget _activityBodyBox(String status) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Container(
      decoration: BoxDecoration(
          color: Styles.darkGrey,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(sizeScale * 30),
              bottomRight: Radius.circular(sizeScale * 30))),
      margin: EdgeInsets.fromLTRB(
          sizeScale * 20.0, sizeScale * 74.0, sizeScale * 20.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(status,
              style: Styles.alertTitles,
              textAlign: TextAlign.start,
              textScaleFactor: sizeScale),
        ],
      ),
      height: 80,
    );
  }

  Widget _playerColorBox(
    Color color,
    String label,
  ) {
    double sizeScale = Styles.screenSize(context) / 987;

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sizeScale * 30),
              topRight: Radius.circular(sizeScale * 30))),
      margin: EdgeInsets.fromLTRB(sizeScale * 20.0, 0, sizeScale * 20.0, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: Styles.homeTitles, textScaleFactor: sizeScale),
          ]),
      height: 50,
    );
  }

  Widget _playerBodyBox(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Container(
      decoration: BoxDecoration(
          color: Styles.pageBackground,
          //border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(sizeScale * 30),
              bottomRight: Radius.circular(sizeScale * 30))),
      margin: EdgeInsets.fromLTRB(
          sizeScale * 20.0, sizeScale * 54.0, sizeScale * 20.0, 0),
      child: Table(border: TableBorder.all(color: Colors.white), children: [
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            'Jimmy',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              'Good',
              style: Styles.riskGood,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            'Jessica',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              'Caution',
              style: Styles.riskCaution,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            'Joe',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              '',
              style: Styles.riskCritical,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            'Julia',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              'Good',
              style: Styles.riskGood,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            '---------',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              '---------',
              style: Styles.playerNames,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            '---------',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              '---------',
              style: Styles.playerNames,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            '---------',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              '---------',
              style: Styles.playerNames,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
           )),
        ]),
        TableRow(children: [
          TableCell(
              child: Center(
                  child: Text(
            '---------',
            style: Styles.playerNames,
            textScaleFactor: sizeScale,
          ))),
          TableCell(
            child: Center(
                child: Text(
              '---------',
              style: Styles.playerNames,
              textScaleFactor: sizeScale,
            )), //
          ),
        ]),
      ]),
      height: 500,
    );
  }
}
