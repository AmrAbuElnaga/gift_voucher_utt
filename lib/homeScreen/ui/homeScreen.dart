import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/amrandroidproject/gift_voucher_utt/lib/homeScreen/ui/company_item.dart';
import 'package:giftvoucher/Network/Api_Call.dart';
import 'package:giftvoucher/homeScreen/model/AllCompanies.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeScreenState();
  }
}

// ignore: camel_case_types
class homeScreenState extends State<homeScreen> {
  AllCompanies allCompanies;
  List<dynamic> body;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      drawer: Padding(
        padding: EdgeInsets.only(bottom: 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50), topRight: Radius.circular(50)),
          child: SizedBox(
            width: 250,
            height: MediaQuery.of(context).size.height,
            child: Drawer(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 10,
                          height: 10,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Image.asset(
                        'images/gift_voucher_logo.png',
                        width: 65,
                        height: 65,
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 20,
                      child: AutoSizeText(
                        'hi,jumia',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 15,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/prize.png',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: AutoSizeText(
                                      'Orders',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontFamily: 'thesansbold'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20,left: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'images/settings.png',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: AutoSizeText(
                                      'Settings',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontFamily: 'thesansbold'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      right: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'images/saroee.png',
                          width: 65,
                          height: 65,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height - 130,
                      left: 20.0,
                      child: Container(
                        height: 130,
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/logout.png",
                              width: 18,
                              height: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: AutoSizeText(
                                'Logout',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Image.asset(
                                'images/mygift.png',
                                width: 130,
                                height: 130,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: Api_Call().getAllCompanies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              );
            } else {
              allCompanies =
                  AllCompanies.fromJSON(snapshot.data); //ADD ALL COMPANIES
              body = allCompanies.body; //ADD DATA TO BODY

              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: const Color(0xFFF0F0F0),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'images/masora.png',
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: -30,
                    child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 300),
                      child: Image.asset(
                        'images/saroee.png',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 60.0,
                              left: 20.0,
                            ),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              'Hi,Jumia',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20.0,
                          ),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: AutoSizeText(
                            'Get the popular gift vouchers',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontFamily: 'thesansbold'),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 10.0, top: 10),
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: (200 / 240),
                              mainAxisSpacing: 5,
                              children: new List<Widget>.generate(body.length,
                                  (index) {
                                return CompanyItem(body[index]['username'],
                                    body[index]['picture']);
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 15,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: const Color(0xFF393939),
                        size: 30,
                      ),
                      onPressed: () => scaffoldKey.currentState.openDrawer(),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: const Color(0xFF393939),
                              size: 27,
                            ),
                            onPressed: () =>
                                scaffoldKey.currentState.openDrawer(),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: const Color(0xFF393939),
                              size: 27,
                            ),
                            onPressed: () =>
                                scaffoldKey.currentState.openDrawer(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
