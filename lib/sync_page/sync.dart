import 'package:arisapp/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import '../styles.dart';

class Sync extends StatefulWidget {
  @override
  createState() => _SyncState();
}

class _SyncState extends State<Sync> {
  int _currentIndex = 0; // bottom nav bar

  @override
  Widget build(BuildContext context) {
//    double sizeScale = Styles.screenSize(context) / 987;

    return Scaffold(
        backgroundColor: Styles.pageBackground,
        appBar: HomeAppBar(
          title: Text('Cloud Sync', style: Styles.title),
        ),
        
        body: _bottomBarNavigate(context, _currentIndex),
        );
  }

  _bottomBarNavigate(BuildContext context, int navSelect) {
    double heightScale = Styles.displayHeight(context) / 896;      
          return SizedBox(
              height: Styles.displayHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: heightScale * 24),
                  _syncSubtitle(context),
                  SizedBox(height: heightScale * 40),
                   _userDetails(context),
                ],
              ));
        
    
  }

  Widget _userDetails(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _userTitle('Instructions'),
        _userData(' Ensure App Has Access to Internet'),
        _userData(' Download User Data to App'),
        _userData(' Upload Session Data to Cloud'),
        _userData(' If your device asks for a passkey, enter digits 0000 and press OK'),
      ],
    );
  }

 Widget _syncSubtitle(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Container(
            constraints: BoxConstraints(
                maxHeight: heightScale * 179, maxWidth: widthScale * 410),
            child: Stack(children: [
              Align(
                  alignment: Alignment(0.8, -1.0),
                  child: FittedBox(
                      child: RichText(
                          textScaleFactor: sizeScale,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'ARIS Device Status',
                                style:  Styles.titleUnderline, 
                                ),
                            //TextSpan(
                               // text: ' Live', style: Styles.loginHelpGreen),
                          ])))),
              Align(
                  alignment: Alignment(-1.0, -1.0),
                  child: Image.asset('assets/sync_loop.png',
                      height: heightScale * 195,
                      width: widthScale * 125,
                      fit: BoxFit.contain)),
//

              Align(
                  alignment: Alignment(0.8, 0.0),
                  child: FittedBox(
                      child: RichText(
                          textScaleFactor: sizeScale,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Syncing From Cloud',
                                style:  Styles.subTitleBlue, 
                                ),
                            //TextSpan(
                               // text: ' Live', style: Styles.loginHelpGreen),
                          ])))),
            ]));
  }
  Widget _userData(String label) {
    double heightScale = Styles.displayHeight(context) / 896;
    double sizeScale = Styles.screenSize(context) / 987;
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label,
                  style: Styles.infoWhite, textScaleFactor: sizeScale,softWrap: true,),
            ),
            
          ],
        ),
        SizedBox(height: heightScale * 30),
        Container(
          height: heightScale * 3,
          color: Styles.darkGrey,
        ),
        SizedBox(height: heightScale * 30),
      ],
    );
  }
  Widget _userTitle(String label) {
    double heightScale = Styles.displayHeight(context) / 896;
    double sizeScale = Styles.screenSize(context) / 987;
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment(-0.8, 0),
              child: Text(label,
                  style: Styles.infoWhitesub, textScaleFactor: sizeScale),
            ), 
          ],
        ),
      SizedBox(height: heightScale * 30),
        Container(
          height: heightScale * 3,
          color: Styles.pageBackground,
        ),
        SizedBox(height: heightScale * 30),
      ],
    );
  }
}
