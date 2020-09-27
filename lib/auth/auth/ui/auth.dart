import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/auth/forget_pass/ui/forget_pass.dart';

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

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
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
          if(_authMode == AuthMode.Signup)
          Positioned(
            top: MediaQuery.of(context).size.height * .85 / 3,
            right: MediaQuery.of(context).size.width * .4 / 3,
            child: GestureDetector(
              onTap: ()
              {
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
            padding: const EdgeInsets.only(top: 40.0, left: 20.0),
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
              controller: emailController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: false,
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
          if (_authMode == AuthMode.Login)
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 15.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: ()
                      {
                       forget_password(context); //CALL GO TO FORGET PASSWORD METHOD
                      },
                      child: AutoSizeText('Forget Password'))),
            ),
          if (_authMode == AuthMode.Login)
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
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
            )
          else
            Center(
              child: Container(
                margin: EdgeInsets.all(30.0),
                width: MediaQuery.of(context).size.width * 1 / 3,
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
}
