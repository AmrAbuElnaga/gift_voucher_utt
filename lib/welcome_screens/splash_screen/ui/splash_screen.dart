import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giftvoucher/utils.dart';
import 'package:giftvoucher/welcome_screens/welcome_tour/ui/welcome_tour.dart';

class splash_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    new utils().splash_screen(context, welcome_tour());

    // TODO: implement build
    return Scaffold(
      body: Container(
          child: Image.asset(
        'images/splash.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      )),
    );
  }
}
