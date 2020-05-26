import 'package:arisapp/Login_Help/create_account.dart';
import 'package:arisapp/Login_Help/forgot_password.dart';
import 'package:arisapp/login_page.dart';
import 'package:flutter/material.dart';
import 'components/home_app_bar.dart';
import 'components/home_bottom_nav_bar.dart';
import 'styles.dart';
import 'Home_AppBar_Pages/Profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Choice selectedChoice = choices[0];
  String tapChoice = '';
  Choice selectedAccount = accounts[0];
  String tapAccount = ''; // top nav bar
  int _currentIndex = 0; // bottom nav bar

  @override
  Widget build(BuildContext context) {
    double size = Styles.screenSize(context)/987;
    double barHeight = Styles.displayHeight(context)/896;
    double barWidth = Styles.displayWidth(context)/414;

    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(56*barHeight),
        child:
        HomeAppBar(
          title: GestureDetector(
              onTap: () {
                setState(() {
                  _navigateToProfile(context);
                });
              },
              child: Icon(Icons.account_circle,
                  color: Styles.homeBlue, size: 60.0*barHeight)),
          leading: PopupMenuButton<Choice>(
            // can "leading" code block be transferred to home_app_bar and called in this file?
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            icon: Icon(Icons.menu, size: 30.0*barHeight),
            color: Styles.pageBackground,
            onSelected: _menuSelect,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice menuSelect) {
                return PopupMenuItem<Choice>(
                    value: menuSelect,
                    child: Column(children: [
                      Row(children: [
                        Icon(menuSelect.icon, size: 24*size),
                        SizedBox(width: 10*barWidth),
                        Text(menuSelect.title, style: Styles.infoWhite, textScaleFactor: size)
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
              icon: Icon(Icons.group_add, size: 40.0*barHeight),
              color: Styles.pageBackground,
              onSelected: _accountSelect,
              itemBuilder: (BuildContext context) {
                return accounts.map((Choice accountSelect) {
                  return PopupMenuItem<Choice>(
                      value: accountSelect,
                      child: Column(children: [
                        Row(children: [
                          Icon(accountSelect.icon),
                          SizedBox(width: 10*barWidth),
                          Text(accountSelect.title, style: Styles.infoWhite)
                        ])
                      ]));
                }).toList();
              },
            ),
          ],
        ),
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
    );
  }

  Widget footPressure(BuildContext context) {
    double size = Styles.screenSize(context) / 987;
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToFootPressureDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight: Styles.displayHeight(context) * 0.2,
                maxWidth: Styles.displayWidth(context) * 0.99),
            child: Stack(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: RichText(
                          textScaleFactor: size,
                          text: TextSpan(
                              style: Styles.arisLogoText,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Foot Pressure',
                                    style: Styles.homeTitles),
                                TextSpan(
                                    text: ' Live',
                                    style: Styles.loginHelpGreen),
                              ])))),
              Align(
                  alignment: Alignment(-.8, 1.0),
                  child: Image.asset('assets/pressure.png',
                      height: Styles.displayHeight(context) * 0.145,
                      width: Styles.displayWidth(context) * 0.302,
                      fit: BoxFit.contain)),
//

              Align(
                  alignment: Alignment(-1.0, 1.0),
                  child: Container(
                      margin: EdgeInsets.fromLTRB(
                          Styles.displayWidth(context) * 0.435, 0, 0, 0),
                      constraints: BoxConstraints.expand(
                          height: Styles.displayHeight(context) * 0.145),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Styles.homeBlue),
                      child: Text(
                          //find a way to organize this without manually spacing in between text.
                          '                     left    right\n\n Resting     28N    29N\n\n  Active       35N   40N',
                          style: Styles.infoBlack,
                          textScaleFactor: size)))
            ])));
  }

  Widget balance(BuildContext context) {
    double size = Styles.screenSize(context) / 987;
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToBalanceDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight: Styles.displayHeight(context) * 0.2,
                maxWidth: Styles.displayWidth(context) * 0.99),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.75, -1.0),
                  child: RichText(
                      textScaleFactor: size,
                      text: TextSpan(
                          style: Styles.arisLogoText,
                          children: <TextSpan>[
                            TextSpan(text: 'Balance', style: Styles.homeTitles),
                            TextSpan(
                                text: ' Live', style: Styles.loginHelpGreen),
                          ]))),
              Align(
                  alignment: Alignment(-.8, 1.0),
                  child: Image.asset('assets/balance.png',
                      height: Styles.displayHeight(context) * 0.145,
                      width: Styles.displayWidth(context) * 0.302,
                      fit: BoxFit.contain)),
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints.tightFor(
                        height: Styles.displayHeight(context) * 0.0558),
                    margin: EdgeInsets.fromLTRB(
                        Styles.displayWidth(context) * 0.435, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.homeBlue),
                    child: Text('Balance Bias: LEFT',
                        textAlign: TextAlign.center,
                        style: Styles.infoBlack,
                        textScaleFactor: size),
                  ))
            ])));
  }

  Widget activity(BuildContext context) {
    double size = Styles.screenSize(context) / 987;
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToActivityDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight: Styles.displayHeight(context) * 0.2,
                maxWidth: Styles.displayWidth(context) * 0.99),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.7, -1.0),
                  child: RichText(
                      textScaleFactor: size,
                      text: TextSpan(style: Styles.arisLogoText, children: <
                          TextSpan>[
                        TextSpan(text: 'Activity', style: Styles.homeTitles),
                        TextSpan(text: ' Live', style: Styles.loginHelpGreen),
                      ]))),
              Align(
                  alignment: Alignment(-0.8, 1.0),
                  child: Image.asset('assets/activity.png',
                      height: Styles.displayHeight(context) * 0.145,
                      width: Styles.displayWidth(context) * 0.302,
                      fit: BoxFit.contain)),
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints.tightFor(
                        height: Styles.displayHeight(context) * 0.0558),
                    margin: EdgeInsets.fromLTRB(
                        Styles.displayWidth(context) * 0.435, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.homeBlue),
                    child: Text('Steps: 2400 ',
                        style: Styles.infoBlack, textScaleFactor: size),
                  ))
            ])));
  }

  void _menuSelect(Choice choice) {
    // top nav bar
    setState(() {
      selectedChoice = choice;
      print(choice.title);
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
                MaterialPageRoute(builder: (context) => CreateAccount()));
          }
          break;
        case "Kobe":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateAccount()));
          }
          break;
        case "Har_en":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateAccount()));
          }
          break;
        case "Add Profile":
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateAccount()));
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
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
        break;
      case 1:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAccount()));
        }
        break;
      case 2:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAccount()));
        }
        break;
      case 3:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAccount()));
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
          builder: (context) => PasswordHelp(),
        ));
  }

  _navigateToBalanceDetail(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordHelp(),
        ));
  }

  _navigateToActivityDetail(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordHelp(),
        ));
  }
}
