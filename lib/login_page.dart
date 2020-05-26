import 'package:arisapp/home_page.dart';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'Login_Help/forgot_password.dart';
import 'Login_Help/create_account.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "Username";
  String _password = "Password";
  bool _showPassword = false;

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Scaffold(
        // appBar: DefaultAppBar(),

        backgroundColor: Styles.pageBackground,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: heightScale * 110),
            _arisLogo(context),
            SizedBox(height: heightScale * 54),
            _loginForm(),
            SizedBox(height: heightScale * 88),
            _loginHelp(context),
          ],
        )));
  }

  Widget _arisLogo(BuildContext context) {
    return Styles.arisLogo(context);
  }

  Widget _loginForm() {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Container(
        margin: EdgeInsets.all(sizeScale * 50),
        child: Form(
            key: _loginKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  emailField(_username),
                  SizedBox(height: heightScale * 22),
                  passwordField(_password),
                  SizedBox(height: heightScale * 66),
                  Container(
                      constraints: BoxConstraints.expand(
                          width: widthScale * 353, height: heightScale * 55),
                      child: RaisedButton(
                        // in the future make this button rounded
                        color: Colors.cyan,
                        child: Text('Login',
                            style: Styles.loginButton,
                            textScaleFactor: sizeScale),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(sizeScale * 30.0)),
                        onPressed: () {
                          if (!_loginKey.currentState.validate()) {
                            return;
                          }
                          _loginKey.currentState.save();

                          print('Username: $_username');
                          print('Password: $_password');
                          _navigateToHomePage(context);
                        },
                      ))
                ])));
  }

  Widget emailField(String username) {
    double sizeScale = Styles.screenSize(context) / 987;
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 12*sizeScale),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        labelText: username,
        labelStyle: TextStyle(
            fontFamily: Styles.font,
            fontSize: Styles.textSizeInfo * sizeScale,
            color: Styles.textGrey,
            fontWeight: FontWeight.w700),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Styles.arisBlue)),
      ),
      style: TextStyle(
          fontFamily: Styles.font,
          fontSize: Styles.textSizeBodyM * sizeScale,
          color: Styles.textWhite,
          fontWeight: FontWeight.w700),
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.left,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return '$username is Required';
        }
      },
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget passwordField(String password) {
    double sizeScale = Styles.screenSize(context) / 987;
    return TextFormField(
      //controller: _passwordController,
      decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 12*sizeScale),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          labelText: password,
          labelStyle: TextStyle(
              fontFamily: Styles.font,
              fontSize: Styles.textSizeInfo * sizeScale,
              color: Styles.textGrey,
              fontWeight: FontWeight.w700),
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                size: 24*sizeScale,
              ))),
      obscureText: !_showPassword,
      style: TextStyle(
        fontFamily: Styles.font,
        fontSize: Styles.textSizeBodyM * sizeScale,
        color: Styles.textWhite,
        fontWeight: FontWeight.w700,
      ),
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.left,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return '$password is Required';
        }
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _loginHelp(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
              onTap: () => _navigateToPasswordHelp(context),
              child: Container(
                  //margin: EdgeInsets.all(50),
                  child: RichText(
                      textScaleFactor: sizeScale,
                      text: TextSpan(
                          style: Styles.loginHelp,
                          children: <TextSpan>[
                            TextSpan(text: 'Forgot password?'),
                            TextSpan(
                                text: ' Click Here',
                                style: Styles.loginHelpGreen),
                          ]),
                      textAlign: TextAlign.center))),
          GestureDetector(
              onTap: () => _navigateToCreateAccount(context),
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: RichText(
                    textScaleFactor: sizeScale,
                    text:
                        TextSpan(style: Styles.loginHelp, children: <TextSpan>[
                      TextSpan(text: "\nDon't have an account?"),
                      TextSpan(
                          text: ' Click Here', style: Styles.loginHelpGreen)
                    ]),
                    textAlign: TextAlign.center,
                  ))),
          SizedBox(height: heightScale * 44),
        ]);
  }

  void _navigateToHomePage(context) {
    // "Context" means the widget is NOT the primary branch, but also not a leaf.
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  void _navigateToPasswordHelp(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordHelp(),
        ));
  }

  void _navigateToCreateAccount(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateAccount(),
        ));
  }
}
