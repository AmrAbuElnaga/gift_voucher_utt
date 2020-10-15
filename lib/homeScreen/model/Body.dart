//
//  Body.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 12, 2020

import 'package:giftvoucher/auth/auth/model/Attachment.dart';
import 'package:giftvoucher/homeScreen/model/Category.dart';

class Body {
  Attachment attachment;    
  String birthdate;    
  List<Category> category;    
  var commercialReg;
  String country;    
  String description;    
  String email;
  var gender;
  int id;    
  String phone;    
  String picture;
  var profitShare;
  String realPassword;    
  String roleId;    
  String suspend;
  var tax;
  var token;
  String username;    

  Body.fromJSON(Map<String, dynamic> parsedJson) {    
    this.attachment = parsedJson['attachment'];    
    this.birthdate = parsedJson['birthdate'];    
    this.category = parsedJson['category'];    
    this.commercialReg = parsedJson['commercial_reg'];    
    this.country = parsedJson['country'];    
    this.description = parsedJson['description'];    
    this.email = parsedJson['email'];    
    this.gender = parsedJson['gender'];    
    this.id = parsedJson['id'];    
    this.phone = parsedJson['phone'];    
    this.picture = parsedJson['picture'];    
    this.profitShare = parsedJson['profit_share'];    
    this.realPassword = parsedJson['real_password'];    
    this.roleId = parsedJson['role_id'];    
    this.suspend = parsedJson['suspend'];    
    this.tax = parsedJson['tax'];    
    this.token = parsedJson['token'];    
    this.username = parsedJson['username'];    
  }
}