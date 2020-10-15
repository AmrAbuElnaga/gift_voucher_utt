//
//  AllCompanies.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 12, 2020

import 'package:giftvoucher/homeScreen/model/Body.dart';

class AllCompanies {
  List<dynamic> body;
  String message;
  int status;

  AllCompanies.fromJSON(Map<String, dynamic> parsedJson) {
    this.body = parsedJson['body'];
    this.message = parsedJson['message'];
    this.status = parsedJson['status'];
  }
}