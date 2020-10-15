//
//  Attachment.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 12, 2020

class Attachment {
  var description;
  String extension;    
  int id;    
  String name;    
  String path;    
  String type;    

  Attachment.fromJSON(Map<String, dynamic> parsedJson) {    
    this.description = parsedJson['description'];    
    this.extension = parsedJson['extension'];    
    this.id = parsedJson['id'];    
    this.name = parsedJson['name'];    
    this.path = parsedJson['path'];    
    this.type = parsedJson['type'];    
  }
}