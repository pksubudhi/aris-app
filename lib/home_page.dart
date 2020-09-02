import 'package:arisapp/Login_Help/create_account.dart';
import 'package:arisapp/Login_Help/forgot_password.dart';
import 'package:arisapp/login_page.dart';
import 'package:flutter/material.dart';
import 'components/home_app_bar.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:arisapp/home_appbar_pages/leading/bluetooth/backgroundcollectingtask-providertest.dart';
import 'package:arisapp/Recovery_page/recovery_page.dart';
import 'components/home_bottom_nav_bar.dart';
import 'styles.dart';
import 'Home_AppBar_Pages/title/profile.dart';
import 'home_page_sections/foot_pressure.dart';
import 'home_page_sections/activity.dart';
import 'home_page_sections/balance.dart';
import 'sync_page/sync.dart';
import 'profile_page/add_profile.dart';
import 'home_appbar_pages/leading/bluetooth/bluetooth.dart';
import 'injury_page/live_alert.dart';
import 'threshold_page/threshold.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  final Key keyUIStateBT = PageStorageKey('UIStateBT');
//  final PageStorageBucket bucket = PageStorageBucket(); //STATE MANAGEMENT
  Choice selectedChoice = choices[0];
  String tapChoice = '';
  Choice selectedAccount = accounts[0];
  String tapAccount = ''; // top nav bar
  int _currentIndex = 2; // bottom nav bar

  @override
  Widget build(BuildContext context) {
    double size = Styles.screenSize(context) / 987;
    double barWidth = Styles.displayWidth(context) / 414;

    return new WillPopScope(
      // cancels popping functionality on this page (there is no back button)
      onWillPop: () async => false,
      child: new Scaffold(
        backgroundColor: Styles.pageBackground,
        appBar: HomeAppBar(
          title: GestureDetector(
              onTap: () {
                setState(() {
                  _navigateToProfile(context);
                });
              },
              child: Icon(Icons.account_circle,
                  color: Styles.homeBlue, size: 60.0)),
          leading: PopupMenuButton<Choice>(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(size * 20.0))),
            icon: Icon(Icons.menu, size: 30.0),
            color: Styles.pageBackground,
            onSelected: _menuSelect,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice menuSelect) {
                return PopupMenuItem<Choice>(
                    value: menuSelect,
                    child: Column(children: [
                      Row(children: [
                        Icon(menuSelect.icon, size: 24),
                        SizedBox(width: 10 * barWidth),
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
                  borderRadius: BorderRadius.all(Radius.circular(size * 20.0))),
              icon: Icon(Icons.group_add, size: 40.0),
              color: Styles.pageBackground,
              onSelected: _accountSelect,
              itemBuilder: (BuildContext context) {
                return accounts.map((Choice accountSelect) {
                  return PopupMenuItem<Choice>(
                      value: accountSelect,
                      child: Column(children: [
                        Row(children: [
                          Icon(accountSelect.icon, size: 24),
                          SizedBox(width: 10 * barWidth),
                          Text(accountSelect.title, style: Styles.infoWhite)
                        ])
                      ]));
                }).toList();
              },
            ),
          ],
        ),
        body: SizedBox(
            height: Styles.displayHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                footPressure(context),
                balance(context),
                activity(context),
              ],
            )),
        bottomNavigationBar: HomeBottomNavBar(
          currentIndex: _currentIndex,
          iconSize: 40.0 * size,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                title: Text('Injury', textScaleFactor: size)),
            BottomNavigationBarItem(
                icon: Icon(Icons.equalizer),
                title: Text('Biomech.', textScaleFactor: size)),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home', textScaleFactor: size)),
            BottomNavigationBarItem(
                icon: Icon(Icons.timeline),
                title: Text('Threshold', textScaleFactor: size)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text('Recovery', textScaleFactor: size))
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(index);
              _bottomBarNavigate(index);
            });
          },
        ),
      ),
    );
  }

  Widget footPressure(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;

    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToFootPressureDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight: heightScale * 179, maxWidth: widthScale * 410),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.9, -1.0),
                  child: FittedBox(
                      child: RichText(
                          textScaleFactor: sizeScale,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Foot Pressure',
                                style: Styles.homeTitles),
                            TextSpan(
                                text: ' Live', style: Styles.loginHelpGreen),
                          ])))),
              Align(
                  alignment: Alignment(-.8, 1.0),
                  child: Image.asset('assets/pressure.png',
                      height: heightScale * 130,
                      width: widthScale * 125,
                      fit: BoxFit.contain)),
//

              Align(
                  alignment: Alignment(-1.0, 1.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(widthScale * 180, 0, 0, 0),
                    constraints:
                        BoxConstraints.expand(height: heightScale * 130),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sizeScale * 30),
                        color: Styles.homeBlue),
                    child: Stack(children: [
                      alignData(0.03, -0.8, 'Left'),
                      alignData(0.75, -0.8, 'Right'),
                      alignData(-0.8, 0, 'Resting'),
                      alignData(-0.8, 0.8, 'Active'),
                      alignDataBold(0.05, 0, '28N'),
                      alignDataBold(0.7, 0, '25N'),
                      alignDataBold(0.05, 0.8, '50N'),
                      alignDataBold(0.7, 0.8, '45N'),
                    ]),
                  )),
            ])));
  }

  Widget alignData(double x, double y, String text) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Text(text, style: Styles.infoBlack, textScaleFactor: sizeScale));
  }

  Widget alignDataBold(double x, double y, String text) {
    double sizeScale = Styles.screenSize(context) / 987;
    return Align(
        alignment: Alignment(x, y),
        child: Text(text,
            style: Styles.infoBlackBold, textScaleFactor: sizeScale));
  }

  Widget balance(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToBalanceDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight: heightScale * 179, maxWidth: widthScale * 410),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.75, -1.0),
                  child: RichText(
                      textScaleFactor: sizeScale,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(text: 'Balance', style: Styles.homeTitles),
                        TextSpan(text: ' Live', style: Styles.loginHelpGreen),
                      ]))),
              Align(
                  alignment: Alignment(-.8, 1.0),
                  child: Image.asset('assets/balance.png',
                      height: heightScale * 130,
                      width: widthScale * 125,
                      fit: BoxFit.contain)),
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    constraints:
                        BoxConstraints.tightFor(height: heightScale * 50),
                    margin: EdgeInsets.fromLTRB(widthScale * 180, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.homeBlue),
                    child: RichText(
                        textScaleFactor: sizeScale,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'Balance Bias:', style: Styles.infoBlack),
                          TextSpan(text: '  LEFT', style: Styles.infoBlackBold),
                        ])),
                  )),
            ])));
  }

  Widget activity(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;

    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToActivityDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight: heightScale * 179, maxWidth: widthScale * 410),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.7, -1.0),
                  child: RichText(
                      textScaleFactor: sizeScale,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(text: 'Activity', style: Styles.homeTitles),
                        TextSpan(text: ' Live', style: Styles.loginHelpGreen),
                      ]))),
              Align(
                  alignment: Alignment(-0.8, 1.0),
                  child: Image.asset('assets/activity.png',
                      height: heightScale * 130,
                      width: widthScale * 125,
                      fit: BoxFit.contain)),
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    constraints:
                        BoxConstraints.tightFor(height: heightScale * 50),
                    margin: EdgeInsets.fromLTRB(widthScale * 180, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.homeBlue),
                    child: RichText(
                        textScaleFactor: sizeScale,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(text: 'Steps:', style: Styles.infoBlack),
                          TextSpan(text: '  2400', style: Styles.infoBlackBold)
                        ])),
                  )),
            ])));
  }

  void _menuSelect(Choice choice) {
    // top nav bar
    setState(() {
      selectedChoice = choice;
      print("You selected menu item: "+choice.title);
      tapChoice = choice.title;
      switch (tapChoice) {
        case "Log out":
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
          break;
        case "Account":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateAccount()));
          }
          break;
        case "Sync":
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Sync()));
          }
          break;
        case "ARISE Connect":
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bluetooth()));
//                PageStorage (child: Bluetooth(key: keyUIStateBT), bucket: bucket)));
          }
          break;
        default:
          {
            //statements;
          }
          break;
      }
    });
  }

  void _accountSelect(Choice account) {
    // top nav bar
    setState(() {
      selectedAccount = account;
      print(account.title);
      tapAccount = account.title;
      switch (tapAccount) {
        case "James":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PasswordHelp()));
          }
          break;
        case "Kobe":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PasswordHelp()));
          }
          break;
        case "Har_en":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PasswordHelp()));
          }
          break;
        case "Add Profile":
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProfile()));
          }
          break;
        default:
          {
            //statements;
          }
          break;
      }
    });
  }

  _bottomBarNavigate(int navSelect) {
    switch (navSelect) {
      case 0:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LiveAlert()));
        }
        break;
      case 1:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PasswordHelp()));
        }
        break;
      case 2:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        break;
      case 3:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThresholdPage()));
        }
        break;
      case 4:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RecoveryPage()));
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  _navigateToProfile(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(),
        ));
  }

  _navigateToFootPressureDetail(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FootPressure(),
        ));
  }

  _navigateToBalanceDetail(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Balance(),
        ));
  }

  _navigateToActivityDetail(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Activity(),
        ));
  }
}
