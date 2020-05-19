import 'package:arisapp/Login_Help/create_account.dart';
import 'package:arisapp/Login_Help/forgot_password.dart';
import 'package:arisapp/login_page.dart';
import 'package:flutter/material.dart';
import 'components/home_app_bar.dart';
import 'components/home_bottom_nav_bar.dart';
import 'styles.dart';

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
    return Scaffold(
      backgroundColor: Styles.pageBackground,
      appBar: HomeAppBar(
        leading: PopupMenuButton<Choice>(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          padding: EdgeInsets.all(0.0),
          icon: Icon(Icons.menu, size: 30.0),
          color: Styles.pageBackground,
          onSelected: _menuSelect,
          itemBuilder: (BuildContext context) {
            return choices.map((Choice menuSelect) {
              return PopupMenuItem<Choice>(
                  value: menuSelect,
                  child: Column(children: [
                    Row(children: [
                      Icon(menuSelect.icon),
                      SizedBox(width: 10),
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
                        SizedBox(width: 10),
                        Text(accountSelect.title, style: Styles.infoWhite)
                      ])
                    ]));
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          footPressure(context),
          balance(context),
          activity(context),
        ],
      ),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text('Injury Alert')),
          BottomNavigationBarItem(
              icon: Icon(Icons.equalizer), title: Text('Biomechanics')),
          BottomNavigationBarItem(
              icon: Icon(Icons.timeline), title: Text('Threshold')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text('Recovery'))
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

  /*GestureDetector(
  onTap: () {
  setState(() {
  _showPassword = !_showPassword;
  });
  },*/
  Widget footPressure(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToFootPressureDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints.expand(height: 180),
            //margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Stack(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          style: Styles.arisLogoText,
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Foot Pressure', style: Styles.homeTitles),
                        TextSpan(text: ' Live', style: Styles.loginHelpGreen),
                      ]))),
              Align(
                  alignment: Alignment(-.8, 1.0),
                  child: Image.asset('assets/pressure.png',
                      height: 130, width: 125, fit: BoxFit.fitWidth)),
              Align(
                  alignment: Alignment(-1.0, 1.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                    constraints: BoxConstraints.expand(height: 130),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.arisBlue),
                    child: Text(
                        //find a way to organize this without manually spacing in between text.
                        '                     left    right\n\n Resting     28N    29N\n\n  Active       35N   40N',
                        style: Styles.infoBlack),
                  ))
            ])));
  }

  Widget balance(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToBalanceDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints.expand(height: 180),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.75, -1.0),
                  child: RichText(
                      text: TextSpan(
                          style: Styles.arisLogoText,
                          children: <TextSpan>[
                        TextSpan(text: 'Balance', style: Styles.homeTitles),
                        TextSpan(text: ' Live', style: Styles.loginHelpGreen),
                      ]))),
              Align(
                  alignment: Alignment(-.8, 1.0),
                  child: Image.asset('assets/balance.png',
                      height: 130, width: 125, fit: BoxFit.fitWidth)),
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints.tightFor(height: 50),
                    margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.arisBlue),
                    child: Text('Balance Bias: LEFT',
                        textAlign: TextAlign.center, style: Styles.infoBlack),
                  ))
            ])));
  }

  Widget activity(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigateToActivityDetail(context);
          });
        },
        child: Container(
            constraints: BoxConstraints.expand(height: 180),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.7, -1.0),
                  child: RichText(
                      text: TextSpan(
                          style: Styles.arisLogoText,
                          children: <TextSpan>[
                        TextSpan(text: 'Activity', style: Styles.homeTitles),
                        TextSpan(text: ' Live', style: Styles.loginHelpGreen),
                      ]))),
              Align(
                  alignment: Alignment(-0.8, 1.0),
                  child: Icon(Icons.directions_run,
                      size: 150.0, color: Styles.arisBlue)),
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints.tightFor(height: 50),
                    margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Styles.arisBlue),
                    child: Text('Steps: 2400 ', style: Styles.infoBlack),
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
