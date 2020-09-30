//
//  Role.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on September 29, 2020

class Role {  
  int id;    
  String role;    

  Role.fromJSON(Map<String, dynamic> parsedJson) {    
    this.id = parsedJson['id'];    
    this.role = parsedJson['role'];    
  }
}