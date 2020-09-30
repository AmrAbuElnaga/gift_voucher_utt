//
//  root_login.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 29, 2020

import 'package:giftvoucher/auth/auth/model/Body.dart';

 class root_login {
   Map<String,dynamic> body;
  String message;    
  int status;

  root_login.fromJSON(Map<String, dynamic> parsedJson) {
    this.body = parsedJson['body'];    
    this.message = parsedJson['message'];    
    this.status = parsedJson['status'];    
  }
}