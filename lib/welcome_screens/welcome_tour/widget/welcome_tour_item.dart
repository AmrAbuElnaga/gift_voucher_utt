import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/auth/auth/ui/auth.dart';

// ignore: must_be_immutable
class welcome_tour_item extends StatelessWidget {
  var image;

  welcome_tour_item(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              skip(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20.0),
              child: AutoSizeText(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  //METHOD TO SAVE STATE AND GO TO NEXT PAGE
  skip(BuildContext context) {
    //GO TO NEXT PAGE AND DELETE PATHS
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => auth()),
    );
  }
}
