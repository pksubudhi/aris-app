import 'package:flutter/material.dart';
import 'package:arisapp/components/home_app_bar.dart';
import '../styles.dart';

class AddProfile extends StatefulWidget {
  @override
  createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  String _firstName;
  String _lastName;
  String _age;
  String _gender;
  String _height;
  String _weight;
  String _sport;
  String _injury;
  bool _showPassword = false;

  final GlobalKey<FormState> _accountKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double heightScale = Styles.displayHeight(context) / 896;
    return Scaffold(
        appBar: HomeAppBar(
          title: Text('New Profile', style: Styles.title),
        ),
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
                      child: Text('Create Your Profile',
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
                  /*  confPasswordField(),
                  SizedBox(height: heightScale * 30), */
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
                          print('Age: $_age');
                          print('Gender: $_gender');
                          print('Height(cm): $_height');
                          print('Weight(lbs): $_weight');
                          print('Sport: $_sport');
                          print('Injuries: $_injury');
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
      decoration: fieldDecoration('Age'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Age is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget addressField() {
    return TextFormField(
      decoration: fieldDecoration('Gender'),
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
        _gender = value;
      },
    );
  }

  Widget orgMemberIDField() {
    return TextFormField(
      decoration: fieldDecoration('Height(cm)'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Height is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _height = value;
      },
    );
  }

  Widget phoneNumField() {
    return TextFormField(
      decoration: fieldDecoration('Weight(lbs)'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Weight is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _weight = value;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: fieldDecoration('Sport'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name of Sport is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _sport = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: fieldDecoration('Injuries'),
      style: Styles.infoWhite,
      cursorColor: Styles.textWhite,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.left,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Injuries is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _injury = value;
      },
    );
  }

  //Widget confPasswordField() {
  /*   return TextFormField(
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
  } */

  InputDecoration fieldDecoration(String labelText) {
    //the common field decoration used by all input fields except passwords
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
