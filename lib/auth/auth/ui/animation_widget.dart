import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class animation_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Lottie.asset(
        'animation/login.json',
        width: 100,
        height: 100,
        fit: BoxFit.fill,
        repeat: false
      ),
    );
  }
}
