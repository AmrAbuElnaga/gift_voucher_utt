import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/Network/Api_Call.dart';
import 'package:giftvoucher/auth/verfication_code/ui/verfication_code.dart';
import 'package:giftvoucher/widget/progress_dialog.dart';
import 'package:toast/toast.dart';

class forget_pass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return forget_pass_state();
  }
}

class forget_pass_state extends State<forget_pass> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  'images/forget_pass_img.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5 / 4,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1.5 / 4,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: AutoSizeText(
                        'Forget Password!!!',
                        style: TextStyle(
                            fontFamily: 'thesansbold',
                            color: Colors.black,
                            fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: AutoSizeText(
                        'Enter the email associated \n with your account',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(),
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: (TextStyle(
                              fontFamily: 'thesansbold',
                              color: Colors.grey,
                              fontSize: 14.0)),
                          filled: true,
                          suffixIcon: Icon(
                            Icons.email,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3 / 4,
                width: MediaQuery.of(context).size.width * 1.2 / 3,
                child: RaisedButton(
                  onPressed: () {
                    //LOADING PROGRESS DIALOG
                    progress_dialog().show_dialog(context);
                    //CALL API
                    go_verfication_code(context, emailController.text);
                  },
                  color: Colors.white,
                  child: AutoSizeText(
                    'Reset Password',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //METHOD TO Go VERFICATION CODE
  go_verfication_code(BuildContext context, String email) {
    Api_Call().forget_pass(email).then((value) {
      //STOP DIALOG
      progress_dialog().dismiss_dialog(context);
      //GO TO NEXT PAGE AND DELETE PATHS
      if (value['status'] == 1) {
        Toast.show('We have e-mailed you a verification code!', context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.green);

        // GO TO VERFICAION CODE PAGE
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => verfication_code()),
        );
      } else if (value['status'] == 2) {
        //EMAIL NOT FOUND
        Toast.show('We cant find a user with that e-mail address', context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.orange);
      }
    });
  }
}
