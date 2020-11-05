import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class CompanyDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CompanyDetailsState();
  }
}

class CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height + 90,
        color: const Color(0xFFF0F0F0),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              child: Container(
                alignment: Alignment.topRight,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    color: const Color(0xFF77BEFF),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140,
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    color: const Color(0xFF77BEFF),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 25,
              right: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Gift Voucher From\nSouq ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontFamily: 'thesansbold'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'images/gift_voucher_logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                )),
            Positioned(
              top: 280,
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'About Jumia ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'thesansbold'),
                    ),
                    Container(
                      child: AutoSizeText(
                        'Jumai is app used to shop online Africans with each other\n ✓ Jumia '
                        'Today, History, AwardsJumia Overview. \nWebsite group.jumia.com.'
                        ' Headquarters Lagos (Nigeria).',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        wrapWords: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: AutoSizeText(
                        'Gift Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'thesansbold'),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: AutoSizeText(
                              'Type ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: AutoSizeText(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1.1 / 4,
                            height: 50,
                            child: FlatButton(
                              color: Color(0xFFFFD700),
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                    style: BorderStyle.solid),
                              ),
                              child: AutoSizeText(
                                "Gold",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width *
                                      1.1 /
                                      4,
                                  height: 50,
                                  child: FlatButton(
                                    color: Color(0xFFC0C0C0),
                                    textColor: Colors.black,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.blueAccent,
                                    onPressed: () {
                                      /*...*/
                                    },
                                    child: AutoSizeText(
                                      "Silver",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            width: MediaQuery.of(context).size.width * 1.1 / 4,
                            height: 50,
                            child: FlatButton(
                              color: Color(0xFFe5e4e2),
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: AutoSizeText(
                                "Platinum",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width * 3.5 / 4,
                        alignment: Alignment.center,
                        child: AutoSizeText('100')),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: AutoSizeText(
                              'Selected Price ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: AutoSizeText(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 6,
                            height: 40,
                            child: FlatButton(
                              color: Theme.of(context).backgroundColor,
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: AutoSizeText(
                                "100",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 1 / 6,
                                  height: 40,
                                  child: FlatButton(
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.blueAccent,
                                    onPressed: () {
                                      /*...*/
                                    },
                                    child: AutoSizeText(
                                      "200",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            width: MediaQuery.of(context).size.width * 1 / 6,
                            height: 40,
                            child: FlatButton(
                              color: Colors.white,
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: AutoSizeText(
                                "300",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            width: MediaQuery.of(context).size.width * 1 / 6,
                            height: 40,
                            child: FlatButton(
                              color: Colors.white,
                              textColor: Colors.black,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: AutoSizeText(
                                "400",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: AutoSizeText(
                              'add another price ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.0),
                            child: AutoSizeText(
                              '*',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 5),
                            width: 70,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Price'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              color: Colors.white,
                              width: 50,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Transform.rotate(
                                  angle: 3.15,
                                  child: Image.asset(
                                    'images/back.png',
                                    width: 15,
                                    height: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1.3 / 3,
                          ),
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 1 / 3,
                            height: 45,
                            child: RaisedButton(
                              //     disabledColor: Colors.red,
                              // disabledTextColor: Colors.black,
                              textColor: Colors.black,
                              color: Colors.white,
                              onPressed: () {},
                              child: Text('Next'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
