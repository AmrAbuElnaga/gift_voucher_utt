import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeScreenState();
  }

}

// ignore: camel_case_types
class homeScreenState extends State<homeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: const Color(0xFF77BEFF),
          height: 200,
          width: 160,
         child: Positioned (

         ),
        ),
      ),
    );
  }

}