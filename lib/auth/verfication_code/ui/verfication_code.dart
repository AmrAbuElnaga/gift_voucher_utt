import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class verfication_code extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return verfication_code_state();
  }
}

class verfication_code_state extends State<verfication_code> {
  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();

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
                        'Please enter the 4 digit code send to\n a@a.com',
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
                                    labelText: "Input 1",
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 10.0),
                                  ),
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context).requestFocus(focus);
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
                                focusNode: focus,
                                showCursor: true,
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  labelText: "Input 1",
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                ),
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
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  labelText: "Input 1",
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: AutoSizeText(
                        'Re-send Code',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3 / 4,
                width: MediaQuery.of(context).size.width * 1.2 / 3,
                child: RaisedButton(
                  onPressed: () {},
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
}
