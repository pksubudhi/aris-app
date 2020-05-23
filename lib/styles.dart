import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class Styles {
  static double fontSizeAdjust(context, double fontConstant) {
    double adjustedFont = screenSize(context) * fontConstant;
    return adjustedFont;
  }

//  static double fontConst() {
//    double constant = _textSizeAux / 987;
//    fontSizeAdjust(context, constant);
//  }

  static const double defaultHorizontalPadding = 50;
  static const _textSizeARIS = 56.0; //size
  static const _textSizeTitle = 36.0; //size
  static const _textSizeAux = 30.0; //size
  static const _textSizeBodyB = 24.0; //size
  static const _textSizeBodyM = 20.0; //size
  static const _textSizeInfo = 18.0; //size
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
  static final String _font = GoogleFonts.roboto.toString();
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
    fontFamily: _font,
    fontSize: _textSizeARIS,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final arisLogoI = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeARIS,
    color: arisBlue,
    fontWeight: FontWeight.w700,
  );
  static final info = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeInfo,
    color: textGrey,
    fontWeight: FontWeight.w700,
  );
  static final infoWhite = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeBodyM,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final infoWhiteS = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeBodyS,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final infoBlack = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeBodyM,
    color: arisBlack,
    fontWeight: FontWeight.w700,
  );
  static final homeTitles = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeAux,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final title = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeTitle,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final subTitle = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeBodyB,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final subTitleUnderlined = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeBodyB,
    color: textWhite,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
  static final loginButton = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeAux,
    color: arisBlack,
    fontWeight: FontWeight.w700,
  );
  static final loginHelp = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeGreenButtons,
    color: textWhite,
    fontWeight: FontWeight.w700,
  );
  static final loginHelpGreen = TextStyle(
    fontFamily: _font,
    fontSize: _textSizeGreenButtons,
    color: arisGreen,
    fontWeight: FontWeight.w700,
  );

  static arisLogo(BuildContext context) {
    var welcome = List<Widget>();
    welcome.add(RichText(
      text: TextSpan(style: arisLogoText, children: <TextSpan>[
        TextSpan(text: 'A.R.'),
        TextSpan(text: 'I', style: arisLogoI),
        TextSpan(text: '.S')
      ]),
      textAlign: TextAlign.center,
    ));
    welcome.add(Text('Atlas Recovery & Intelligence System',
        textAlign: TextAlign.center, style: info));
    welcome.add(SizedBox(height: 20));
    welcome.add(Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: logoLine,
              stops: stops,
              end: Alignment.centerLeft,
              begin: Alignment.centerRight)),
      height: 10,
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
    //debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  static double screenSize(context) {
    double a = pow(displayHeight(context), 2);
    double b = pow(displayWidth(context), 2);
    double c = sqrt(a + b);
    debugPrint('Screen Size = $c');
    return c;
  }

  static double displayHeight(context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  static double displayWidth(context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }
}
