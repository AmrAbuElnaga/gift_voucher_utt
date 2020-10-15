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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
          future: Api_Call().getAllCompanies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
              );
            } else {
              allCompanies =
                  AllCompanies.fromJSON(snapshot.data); //ADD ALL COMPANIES
              body = allCompanies.body; //ADD DATA TO BODY

              return Stack(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
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
                              top: 25.0,
                              left: 10.0,
                            ),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                            left: 10.0,
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                left: 25.0, right: 10.0, top: 20),
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
                  )
                ],
              );
            }
          }),
    );
  }
}
