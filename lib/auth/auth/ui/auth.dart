import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/Network/Api_Call.dart';
import 'package:giftvoucher/auth/auth/model/Body.dart';
import 'package:giftvoucher/auth/auth/model/User.dart';
import 'package:giftvoucher/auth/auth/model/root_login.dart';
import 'package:giftvoucher/auth/auth/ui/successful_login.dart';
import 'package:giftvoucher/auth/forget_pass/ui/forget_pass.dart';
import 'package:giftvoucher/local_data/send_data.dart';
import 'package:giftvoucher/widget/progress_dialog.dart';
import 'package:toast/toast.dart';

enum AuthMode { Signup, Login }

class auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return auth_state();
  }
}

class auth_state extends State<auth> {
  AuthMode _authMode = AuthMode.Login;
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController commercialController = new TextEditingController();
  int _value = 1;
  root_login root;

  Body body;
  User user;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
        userController.text = "";
        passController.text = "";
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
        userController.text = "";
        passController.text = "";
        emailController.text = "";
        phoneController.text = "";
        _value = 1;
        commercialController.text = "";
      });
    }
  }

  //METHOD TO Go FORGET PASSWORD
  forget_password(BuildContext context) {
    //GO TO NEXT PAGE AND DELETE PATHS
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => forget_pass()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            '${_authMode == AuthMode.Login ? 'images/login.png' : 'images/signup_bg.png'}',
            height: MediaQuery.of(context).size.height * 1.2 / 3,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 1 / 3,
            child: Container(
              height: MediaQuery.of(context).size.height * .3 / 3,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0))),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 1.05 / 3,
            child: Container(
              height: MediaQuery.of(context).size.height * 1.95 / 3,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(60.0),
                      topRight: const Radius.circular(60.0))),
              child: auth_design(),
            ),
          ),
          if (_authMode == AuthMode.Signup)
            Positioned(
              top: MediaQuery.of(context).size.height * .85 / 3,
              right: MediaQuery.of(context).size.width * .4 / 3,
              child: GestureDetector(
                onTap: () {
                  _switchAuthMode();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        color: Colors.white,
                        width: 60,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/back_one.png',
                            width: 15,
                            height: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget auth_design() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0),
            child: AutoSizeText(
              '${_authMode == AuthMode.Login ? 'Lets Login' : 'Sign Up'}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.0,
                  fontFamily: 'thesansbold'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
            child: TextFormField(
              controller: userController,
              obscureText: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                hintText: 'username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: TextFormField(
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.lock),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                hintText: 'password',
              ),
            ),
          ),
          if (_authMode == AuthMode.Signup)
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                  hintText: 'Email',
                ),
              ),
            ),
          if (_authMode == AuthMode.Signup)
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                obscureText: false,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                  hintText: 'Phone',
                ),
              ),
            ),
          if (_authMode == AuthMode.Signup)
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              child: DropdownButton(
                isExpanded: true,
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text("Choose Type"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("User"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Company"), value: 3),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
          if (_authMode == AuthMode.Signup)
            if (_value == 3)
              Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: TextFormField(
                  controller: commercialController,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.account_balance),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                    hintText: 'Commercial Register',
                  ),
                ),
              ),
          if (_authMode == AuthMode.Login)
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 15.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        forget_password(
                            context); //CALL GO TO FORGET PASSWORD METHOD
                      },
                      child: AutoSizeText('Forget Password'))),
            ),
          if (_authMode == AuthMode.Login)
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    checkLogin(
                        userController.text, passController.text, context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      color: Colors.white,
                      width: 70,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/back.png',
                          width: 15,
                          height: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width * 1 / 3,
                  height: 50.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        checkSignUp(
                            userController.text,
                            passController.text,
                            emailController.text,
                            phoneController.text,
                            commercialController.text,
                            '${_value}',
                            context);
                      },
                      child: AutoSizeText('Signup'),
                    ),
                  ),
                ),
              ),
            ),
          if (_authMode == AuthMode.Login)
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    height: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FlatButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          _switchAuthMode();
                        },
                        child: AutoSizeText('Signup'),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            )),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width * 1 / 2,
                        height: 50.0,
                        child: Center(
                            child: AutoSizeText(
                          'Explore',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  //LOGIN VALIDATION
  void checkLogin(String username, String password, BuildContext context) {
    if ((username.length < 5) || (password.length < 5)) {
      Toast.show('Please Fill All Data !', context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.orange);
    } else {
      progress_dialog().show_dialog(context);
      login_response(username, password, context);
    }
  }

  //CALL LOGIN API
  void login_response(String username, String password, BuildContext context) {
    Api_Call().login(username, password).then((value) {
      //STOP DIALOG
      progress_dialog().dismiss_dialog(context);

      if (value['status'] == 1) {
        //GET ROOT CLASS
        root = root_login.fromJSON(value);
        //GET BODY
        body = Body.fromJSON(root.body);
        //GET USER
        user = User.fromJSON(body.user);
        // SAVE DATA IN SHAREDPREFRENCE
        send_data    ().save_user_data('${user.id}', user.username, user.email,
            user.phone, body.accessToken);
        successful_login().show_dialog(context);
      } else if (value['status'] == 0) {
        root = root_login.fromJSON(value);
        Toast.show('${root.message}', context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    });
  }

  //SIGN UP VALIDATION
  void checkSignUp(String username, String password, String email, String phone,
      String tax, String role, BuildContext context) {
    if ((username.length < 5) ||
        (password.length < 5) ||
        (email.length < 5) ||
        (phone.length < 5)) {
      Toast.show('Please Fill All Data !', context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.orange);
    } else if (role == "1") {
      Toast.show('You Must Choose User Or Company !', context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.orange);
    } else {
      if (tax.length == 0) {
        Toast.show('Please Insert Commercial Register !', context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.orange);
      } else {
        progress_dialog().show_dialog(context);
        signup_response(username, password, email, phone, tax, role, context);
      }
    }
  }

  //CALL SIGNUP API
  void signup_response(String username, String password, String email,
      String phone, String tax, String role, BuildContext context) {
    Api_Call()
        .signup(username, password, phone, role, email, tax)
        .then((value) {
      //STOP DIALOG
      progress_dialog().dismiss_dialog(context);

      if (value['status'] == 1) {
        //GET ROOT CLASS
        root = root_login.fromJSON(value);
        //GET BODY
        body = Body.fromJSON(root.body);
        //GET USER
        user = User.fromJSON(body.user);
        // SAVE DATA IN SHAREDPREFRENCE
        send_data().save_user_data('${user.id}', user.username, user.email,
            user.phone, body.accessToken);
        successful_login().show_dialog(context);
      } else if (value['status'] == 0) {
        root = root_login.fromJSON(value);
        Toast.show('${root.message}', context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    });
  }
}
