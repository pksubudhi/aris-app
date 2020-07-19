import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class Styles {
  static const double defaultHorizontalPadding = 50;
  static const _textSizeARIS = 56.0; //size
  static const _textSizeTitle = 36.0; //size
  static const _textSizeAux = 30.0; //size
  static const _textSizeBodyB = 24.0; //size
  static const textSizeBodyM = 20.0; //size
  static const textSizeInfo = 18.0; //size
  static const _textSizeBodyS = 16.0; //size
  static const _textSizeGreenButtons = 14.0; //size
  static final Color pageBackground = _hexToColor('232323');
  static final Color arisBlue = _hexToColor('47C1E2');
  static final Color arisGreen = _hexToColor('26BB74');
  static final Color arisBlack = _hexToColor('000000');
  static final Color darkGrey = _hexToColor('696969');
  static final Color lightGrey = _hexToColor('9A9A9A');
  static final Color textGrey = _hexToColor('B6B6B6');
  static final Color textWhite = _hexToColor('FFFFFF');
  static final Color boxGrey = _hexToColor('4F4F4F');
  static final Color homeBlue = _hexToColor('4FC4DD');
  static final Color alertRed = _hexToColor('F90707');
  static final Color cautionYellow = _hexToColor('FFAD0E');
  static final String font = GoogleFonts.roboto.toString();
  static final List<Color> logoLine = [
    arisBlack,
    arisBlue,
    arisGreen,
  ];
  static final double fillPercent =
      33; // fills 56.23% for container from bottom
  static final double fillStop = (100 - fillPercent) / 100;
  static final List<double> stops = [0.0, fillStop, 1.0];

  static final arisLogoText = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final arisLogoI = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: arisBlue,
    fontWeight: FontWeight.w700,
  );

  static info(double fontSize) {
    return TextStyle(
      fontFamily: font,
      fontSize: fontSize,
      color: textGrey,
      fontWeight: FontWeight.w700,
    );
  }

  static final infoWhite = TextStyle(
    fontFamily: font,
    fontSize: textSizeBodyM,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
   static final infoWhitesub = TextStyle(
    fontFamily: font,
    fontSize: _textSizeBodyB,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final infoWhiteS = TextStyle(
    fontFamily: font,
    fontSize: _textSizeBodyS,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final infoBlack = TextStyle(
    fontFamily: font,
    fontSize: textSizeBodyM,
    color: arisBlack,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );
  static final infoBlackBold = TextStyle(
    fontFamily: font,
    fontSize: textSizeBodyM,
    color: arisBlack,
    fontWeight: FontWeight.w700,
  );
  static final homeTitles = TextStyle(
    fontFamily: font,
    fontSize: _textSizeAux,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
    static final playerNames = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final riskGood = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: arisGreen,
    fontWeight: FontWeight.w700,
  );
  static final riskCaution = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: cautionYellow,
    fontWeight: FontWeight.w700,
  );
 static final riskCritical = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: alertRed,
    fontWeight: FontWeight.w700,
  );

  static final alertTitles = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final title = TextStyle(
    fontFamily: font,
    fontSize: _textSizeTitle,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final titleUnderline = TextStyle(
    fontFamily: font,
    fontSize: _textSizeTitle,
    color: textWhite,
    fontWeight: FontWeight.w700,
    decoration:TextDecoration.underline,
  );
  static final subTitle = TextStyle(
    fontFamily: font,
    fontSize: _textSizeBodyB,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
   static final subTitleBlue = TextStyle(
    fontFamily: font,
    fontSize: _textSizeARIS,
    color: homeBlue,
    fontWeight: FontWeight.w700,
  );
  static final subTitleUnderlined = TextStyle(
    fontFamily: font,
    fontSize: _textSizeBodyB,
    color: textWhite,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
  static final loginButton = TextStyle(
    fontFamily: font,
    fontSize: _textSizeAux,
    color: arisBlack,
    fontWeight: FontWeight.w700,
  );
  static final loginHelp = TextStyle(
    fontFamily: font,
    fontSize: _textSizeGreenButtons,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final loginHelpGreen = TextStyle(
    fontFamily: font,
    fontSize: _textSizeGreenButtons,
    color: arisGreen,
    fontWeight: FontWeight.w700,
  );

  static arisLogo(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;

    var welcome = List<Widget>();
    welcome.add(RichText(
      textScaleFactor: sizeScale,
      text: TextSpan(style: arisLogoText, children: <TextSpan>[
        TextSpan(text: 'A.R.'),
        TextSpan(text: 'I', style: arisLogoI),
        TextSpan(text: '.S')
      ]),
      textAlign: TextAlign.center,
    ));
    welcome.add(Text('Atlas Recovery & Intelligence System',
        textAlign: TextAlign.center, style: info(textSizeInfo), textScaleFactor: sizeScale));
    welcome.add(SizedBox(height: heightScale * 20));
    welcome.add(Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: logoLine,
              stops: stops,
              end: Alignment.centerLeft,
              begin: Alignment.centerRight)),
      height: heightScale * 10,
    ));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: welcome,
    );
  }

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }

  //SIZING CONSISTENCY FOR DIFFERENT DEVICES
  static Size displaySize(context) {
//    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  static double screenSize(context) {
    double a = pow(displayHeight(context), 2);
    double b = pow(displayWidth(context), 2);
    double c = sqrt(a + b);
//    debugPrint('Screen Size = $c');
    return c;
  }

  static double displayHeight(context) {
//    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  static double displayWidth(context) {
//    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

//    current spacing value/ current screen size = iphone 11 spacing value / iphone 11 screen size
//    current spacing value = iphone 11 spacing value * (current screen size / iphone 11 screen size)
}
