import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/Network/Api_Call.dart';
import 'package:giftvoucher/auth/forget_pass/ui/forget_pass.dart';
import 'package:giftvoucher/auth/set_pass/set_pass.dart';
import 'package:giftvoucher/widget/progress_dialog.dart';
import 'package:toast/toast.dart';

class verfication_code extends StatefulWidget {
  String email;

  verfication_code(this.email);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return verfication_code_state(email);
  }
}

class verfication_code_state extends State<verfication_code> {
  String email;

  verfication_code_state(this.email);

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    final focus_1 = FocusNode();
    final focus_2 = FocusNode();
    TextEditingController txt_1 = new TextEditingController();

    String code;

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
                        'Verify your email',
                        style: TextStyle(
                            fontFamily: 'thesansbold',
                            color: Colors.black,
                            fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: AutoSizeText(
                        'Please enter the 4 digit code send to\n mail@mail.com',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  )),
                              child: Center(
                                child: TextFormField(
                                  showCursor: true,
                                  textInputAction: TextInputAction.next,
                                  autofocus: true,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                  ),
                                  onChanged: (text) {
                                    print('[pd]$text');
                                    if (text.length == 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focus);
                                      //SET CODE FIRST ITEM
                                      code = text;
                                    }
                                  },
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 8.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  )),
                              child: TextFormField(
                                showCursor: true,
                                focusNode: focus,
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                ),
                                onChanged: (text) {
                                  print('[pd]$text');
                                  if (text.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(focus_1);

                                    //SET SECOND TEXT
                                    code = '${code}${text}';
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  )),
                              child: TextFormField(
                                showCursor: true,
                                focusNode: focus_1,
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                ),
                                onChanged: (text) {
                                  print('[pd]$text');
                                  if (text.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(focus_2);

                                    //SET THIRD TEXT
                                    code = '${code}${text}';
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  )),
                              child: TextFormField(
                                showCursor: true,
                                focusNode: focus_2,
                                autofocus: true,
                                textInputAction: TextInputAction.go,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                ),
                                onChanged: (text) {
                                  //SET THIRD TEXT
                                  code = '${code}${text}';
                                },
                                onFieldSubmitted: (_) {
                                  progress_dialog().show_dialog(context);
                                  verfication_code(code, context);
                                },
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                      onTap: ()
                      {
                        progress_dialog().show_dialog(context);
                        forget_pass_state().go_verfication_code(context, email);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: AutoSizeText(
                          'Re-send Code',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent,
                              fontSize: 16.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3 / 4,
                width: MediaQuery.of(context).size.width * 1.2 / 3,
                child: RaisedButton(
                  onPressed: () {
                    progress_dialog().show_dialog(context);
                    verfication_code(code, context);
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

  //CALL LOGIN API
  void verfication_code(String code, BuildContext context) {
    Api_Call().verfication_code(code).then((value) {
      //STOP DIALOG
      progress_dialog().dismiss_dialog(context);

      if (value['status'] == 1) {
        //TOAST MESSAGE
        Toast.show('${value['message']}', context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.green);

        //GO TO NEXT PAGE
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => set_pass(code,email)),
        );
      }
    });
  }
}
