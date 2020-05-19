import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';

class CreateAccount extends StatefulWidget {
  @override
  createState() => _CreateAccountState();
}


class _CreateAccountState extends State<CreateAccount> {
  String _firstName = 'First Name';
  String _lastName = 'Last Name';
  String _orgName = 'Organization Name';
  String _address = 'Address';
  String _orgMemberID = 'ARIS User ID';
  String _phoneNum = 'Phone Number';
  String _email;
  String _password;
  String _idOfField;
  bool _showPassword = false;


  final GlobalKey<FormState> _accountKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(),
        backgroundColor: Styles.pageBackground,
        body: SingleChildScrollView( // also consider using ListView in stead of ScrollView.
            child: Column(
          children: [
            _arisLogo(context),
            SizedBox(height: 20),
            _accountForm(context),
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

  Widget _accountForm(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(50),
        child: Form(
            key: _accountKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Container (
                    child:
                  Text('Create Your Account', style: Styles.subTitle, textAlign: TextAlign.left)),
                  SizedBox(height: 30),
                  field(_firstName),
                  SizedBox(height: 30),
                  field(_lastName),
                  SizedBox(height: 30),
                  field(_orgName),
                  SizedBox(height: 30),
                  field(_address),
                  SizedBox(height: 30),
                  field(_orgMemberID),
                  SizedBox(height: 30),
                  field(_phoneNum),
                  SizedBox(height: 30),
                  emailField(),
                  SizedBox(height: 30),
                  passwordField(),
                  SizedBox(height: 30),
                  confPasswordField(),
                  SizedBox(height: 50),
                  Container(
                      constraints:
                          BoxConstraints.expand(width: 320.0, height: 50.0),
                      child: RaisedButton(
                        // in the future make this button rounded
                        color: Colors.cyan,
                        child: Text('Submit', style: Styles.loginButton),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (!_accountKey.currentState.validate()) {
                            return;
                          }
                          _accountKey.currentState.save();

                          print('First name: $_idOfField');
                          print('Last name: $_lastName');
                          print('email: $_email');
                          print('Organization Name: $_orgName');
                          print('Address: $_address');
                          print('Password: $_password');
                          print('User ARIS ID: $_orgMemberID');
                          print('Phone Number: $_phoneNum');
                        },
                      ))
                ])));
  }

  Widget field(String fieldID) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        labelText: fieldID,
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
          return '$fieldID is Required';
        }
      },
      onSaved: (String value) {
         _idOfField = value;
      },
    );
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
        labelText: 'Email',
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
        if (!RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value)) {
          return 'Please Enter a Valid Email Address.';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: _pass,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          labelText: 'Password',
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
          return 'Password is Required';
        }
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget confPasswordField() {
    return TextFormField(
      controller: _confirmPass,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          labelText: 'Confirm Password',
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
          return 'Please Re-enter Password';
        }
        if (value != _pass.text) return 'Passwords Do Not Match.';
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }
}
