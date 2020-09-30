//
//  Body.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 29, 2020

import 'package:giftvoucher/auth/auth/model/User.dart';

class Body {
  String accessToken;    
  String expiresAt;    
  String tokenType;
  Map<String,dynamic> user;

  Body.fromJSON(Map<String, dynamic> parsedJson) {    
    this.accessToken = parsedJson['access_token'];    
    this.expiresAt = parsedJson['expires_at'];    
    this.tokenType = parsedJson['token_type'];    
    this.user = parsedJson['user'];    
  }
}