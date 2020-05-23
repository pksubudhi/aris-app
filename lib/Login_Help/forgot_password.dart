import 'package:flutter/material.dart';
import '../styles.dart';
import '../components/default_app_bar.dart';


//Ideally, the user will be able to reset password directly on the app via text message ID verification.
//Implementation of such a password reset method will come later. For now, classical email reset link to be used.

class PasswordHelp extends StatefulWidget {
  @override
  createState() => _PasswordHelpState();
}

class _PasswordHelpState extends State<PasswordHelp> {

  String _email;

  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(),
        backgroundColor: Styles.pageBackground,
        body: SingleChildScrollView(
            child: Column(
              children: [
                _arisLogo(context),
                SizedBox(height: 40),
                _emailForm(context),
              ],
            )));
  }

  Widget _arisLogo(BuildContext context) {
    return Styles.arisLogo(context);
  }

  Widget _emailForm(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(50),
        child: Form(
            key: _emailKey,
            child: Column(
                children: <Widget>[
                Text('Reset Password', style: Styles.subTitle),
                  SizedBox(height: 70),
                  emailField(),
                  SizedBox(height: 70),
                  Container(
                      constraints:
                      BoxConstraints.expand(width: 320.0, height: 50.0),
                      child: RaisedButton(
                        // in the future make this button rounded
                        color: Colors.cyan,
                        child: Text('Send', style: Styles.loginButton),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (!_emailKey.currentState.validate()) {
                            return;
                          }
                          _emailKey.currentState.save();

                          print('Recovery email: $_email');
                        },
                      ))
                ])));
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        labelText: 'Enter Recovery Email',
        labelStyle: Styles.info,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Styles.arisBlue)),
      ),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'An Email Address is Required';
        }
        if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value)) {
        return 'Please enter a valid Email Address.';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }
}
