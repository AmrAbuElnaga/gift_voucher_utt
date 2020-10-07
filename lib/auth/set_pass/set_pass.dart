import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/Network/Api_Call.dart';
import 'package:giftvoucher/auth/auth/ui/auth.dart';
import 'package:giftvoucher/auth/set_pass/successful_pass_rest.dart';
import 'package:giftvoucher/widget/progress_dialog.dart';
import 'package:toast/toast.dart';

class set_pass extends StatefulWidget {
  String code;
  String email;

  set_pass(this.code, this.email);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return set_pass_state(code, email);
  }
}

class set_pass_state extends State<set_pass> {
  String code;
  String email;

  set_pass_state(this.code, this.email);

  @override
  Widget build(BuildContext context) {
    TextEditingController passController = new TextEditingController();
    TextEditingController newPassController = new TextEditingController();

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFE),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset(
                  'images/verfication_code.png',
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
                        'Change Password',
                        style: TextStyle(
                            fontFamily: 'thesansbold',
                            color: Colors.black,
                            fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: AutoSizeText(
                        'Please type new password',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                      child: TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                          hintText: 'new password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30.0, left: 30.0, top: 5),
                      child: TextFormField(
                        controller: newPassController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.go,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                          hintText: 'confirm password',
                        ),
                        onFieldSubmitted: (_) {
                          check_inputs(passController.text,
                              newPassController.text, context);
                        },
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
                    check_inputs(
                        passController.text, newPassController.text, context);
                  },
                  color: Colors.white,
                  child: AutoSizeText(
                    'Confirm',
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

  //CHECK INPUTS
  void check_inputs(String pass, String coPass, BuildContext context) {
    if ((pass.isEmpty) || (coPass.isEmpty)) {
      Toast.show('Please Fill All Data', context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.orange);
    } else if (pass != coPass) {
      Toast.show('Password Did not Match !', context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.orange);
    } else {
      //CALL API FUNCTIOIN
      setPass(code, pass, coPass, context);
    }
  }

  //CALL LOGIN API
  void setPass(
      String code, String password, String coPass, BuildContext context) {
    progress_dialog().show_dialog(context);

    //CHECK IF PASS MATCH OR NOT

    Api_Call().resetMyPass(code, password, email, coPass).then((value) {
      //STOP DIALOG
      progress_dialog().dismiss_dialog(context);

      if (value['status'] == 1) {

        //GO TO LOGIN
        successful_pass_rest().show_dialog(context);

      } else if (value['status'] == 0) {
        Toast.show('${value['message']}', context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.orange);
      }
    });
  }
}
