// ignore: camel_case_types
import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftvoucher/auth/auth/ui/animation_widget.dart';
import 'package:giftvoucher/auth/auth/ui/auth.dart';

class successful_pass_rest {
  void show_dialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, anim1, anim2) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                animation_widget(),
                AutoSizeText(
                  'Changed Successfully...',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'thesansbold'),
                )
              ],
            ),
          ),
        );
      },
    );
    //GIVE TIME AND GO TO AUTHENTECATION
    Timer(Duration(seconds: 3), () {
      // 5s over, navigate to a new page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => auth()),
      );
    });
  }
}
