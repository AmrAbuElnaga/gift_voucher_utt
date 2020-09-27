import 'dart:async';

import 'package:flutter/material.dart';

class utils {
  void splash_screen(BuildContext context, var second_page) {
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return second_page;
            })));
  }
}
