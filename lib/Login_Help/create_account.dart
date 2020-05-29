import 'package:flutter/material.dart';
import '../components/default_app_bar.dart';
import '../styles.dart';

class CreateAccount extends StatefulWidget {
  @override
  createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String _firstName;
  String _lastName;
  String _orgName;
  String _address;
  String _orgMemberID;
  String _phoneNum;
  String _email;
  String _password;
  bool _showPassword = false;

  final GlobalKey<FormState> _accountKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Scaffold(
        appBar: DefaultAppBar(),
        backgroundColor: Styles.pageBackground,
        body: SingleChildScrollView(
            // also consider using ListView in stead of ScrollView.
            child: Column(
          children: [
            _arisLogo(context),
            SizedBox(height: heightScale * 20),
            _accountForm(context),
          ],
        )));
  }

  Widget _arisLogo(BuildContext context) {
    return Styles.arisLogo(context);
  }

  Widget _accountForm(BuildContext context) {
    double sizeScale = Styles.screenSize(context) / 987;
    double heightScale = Styles.displayHeight(context) / 896;
    double widthScale = Styles.displayWidth(context) / 414;
    return Container(
        margin: EdgeInsets.all(sizeScale * 50),
        child: Form(
            key: _accountKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Text('Create Your Account',
                          style: Styles.subTitle,
                          textAlign: TextAlign.left,
                          textScaleFactor: sizeScale)),
                  SizedBox(height: heightScale * 30),
                  firstNameField(),
                  SizedBox(height: heightScale * 30),
                  lastNameField(),
                  SizedBox(height: heightScale * 30),
                  orgNameField(),
                  SizedBox(height: heightScale * 30),
                  addressField(),
                  SizedBox(height: heightScale * 30),
                  orgMemberIDField(),
                  SizedBox(height: heightScale * 30),
                  phoneNumField(),
                  SizedBox(height: heightScale * 30),
                  emailField(),
                  SizedBox(height: heightScale * 30),
                  passwordField(),
                  SizedBox(height: heightScale * 30),
                  confPasswordField(),
                  SizedBox(height: heightScale * 30),
                  Container(
                      constraints: BoxConstraints.expand(
                          width: widthScale * 320.0,
                          height: heightScale * 50.0),
                      child: RaisedButton(
                        // in the future make this button rounded
                        color: Colors.cyan,
                        child: Text('Submit',
                            style: Styles.loginButton,
                            textScaleFactor: sizeScale),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(sizeScale * 30.0)),
                        onPressed: () {
                          if (!_accountKey.currentState.validate()) {
                            return;
                          }
                          _accountKey.currentState.save();

                          print('First name: $_firstName');
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

  Widget firstNameField() {
    return TextFormField(
      decoration: fieldDecoration('First Name'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _firstName = value;
      },
    );
  }

  Widget lastNameField() {
    return TextFormField(
      decoration: fieldDecoration('Last Name'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _lastName = value;
      },
    );
  }
  Widget orgNameField() {
    return TextFormField(
      decoration: fieldDecoration('Organization Name'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Organization Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _orgName = value;
      },
    );
  }

  Widget addressField () {
    return TextFormField(
      decoration: fieldDecoration('Address'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget orgMemberIDField() {
    return TextFormField(
      decoration: fieldDecoration('ARIS User ID'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'ARIS User ID is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _orgMemberID = value;
      },
    );
  }

  Widget phoneNumField() {
    return TextFormField(
      decoration: fieldDecoration('Phone Number'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _phoneNum = value;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: fieldDecoration('Email'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
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
      decoration: passwordDecoration('Password'),
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
      decoration: passwordDecoration('Confirm Password'),
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

  InputDecoration fieldDecoration(String labelText) {
    //the common field decoration used by all input fields
    double sizeScale = Styles.screenSize(context) / 987;
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 12 * sizeScale),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan),
      ),
      labelText: labelText,
      labelStyle: Styles.info(Styles.textSizeInfo * sizeScale),
      border:
          UnderlineInputBorder(borderSide: BorderSide(color: Styles.arisBlue)),
    );
  }

  InputDecoration passwordDecoration(String labelText) {
    double sizeScale = Styles.screenSize(context) / 987;
    return InputDecoration(
        errorStyle: TextStyle(fontSize: 12 * sizeScale),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        labelText: labelText,
        labelStyle: Styles.info(Styles.textSizeInfo * sizeScale),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              size: 24 * sizeScale,
            )));
  }
}
