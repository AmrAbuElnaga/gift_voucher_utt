import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyItem extends StatelessWidget {
  String name, pic;

  CompanyItem(this.name, this.pic);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 180,
          ),
          Positioned(
            top: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                padding: EdgeInsets.only(top: 45),
                color: const Color(0xFF77BEFF),
                height: 190,
                width: 150,
                child: Column(
                  children: [
                    Center(
                      child: AutoSizeText(
                        '$name Gift Voucher\nonline shopping',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 115,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  pic,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            left: 20,
            top: 120,
            child: Image.asset(
              'images/cart.png',
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            top: 120,
            child: Container(
              width: 140,
              alignment: Alignment.center,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Get Voucher',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 27,
                        height: 27,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image.asset(
                            'images/back.png',
                            width: 15,
                            height: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
