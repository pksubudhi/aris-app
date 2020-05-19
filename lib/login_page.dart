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
    return Scaffold(
        // appBar: DefaultAppBar(),
        backgroundColor: Styles.pageBackground,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 100),
            _arisLogo(context),
            SizedBox(height: 50),
            _loginForm(),
            SizedBox(height: 80),
            _loginHelp(context),
          ],
        )));
  }

/* //SIZING CONSISTENCY FOR DIFFERENT DEVICES
  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }
  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }*/

  Widget _arisLogo(BuildContext context) {
    return Styles.arisLogo(context);
  }

  Widget _loginForm() {
    return Container(
        margin: EdgeInsets.all(50),
        child: Form(
            key: _loginKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  emailField(_username),
                  SizedBox(height: 20),
                  passwordField(_password),
                  SizedBox(height: 60),
                  Container(
                      constraints:
                          BoxConstraints.expand(width: 320.0, height: 50.0),
                      child: RaisedButton(
                        // in the future make this button rounded
                        color: Colors.cyan,
                        child: Text('Login', style: Styles.loginButton),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
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
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        labelText: username,
        labelStyle: Styles.info,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Styles.arisBlue)),
      ),
      style: Styles.infoWhite,
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
    return TextFormField(
      //controller: _passwordController,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          labelText: password,
          labelStyle: Styles.info,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ))),
      obscureText: !_showPassword,
      style: Styles.infoWhite,
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
              onTap: () => _navigateToPasswordHelp(context),
              child: Container(
                  //margin: EdgeInsets.all(50),
                  child: RichText(
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
                    text:
                        TextSpan(style: Styles.loginHelp, children: <TextSpan>[
                      TextSpan(text: "\nDon't have an account?"),
                      TextSpan(
                          text: ' Click Here', style: Styles.loginHelpGreen)
                    ]),
                    textAlign: TextAlign.center,
                  ))),
          SizedBox(height: 40),
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
