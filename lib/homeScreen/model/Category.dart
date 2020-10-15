//
//  Category.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 12, 2020

class Category {  
  String category;    
  String companyId;    
  int id;    
  String percentage;    
  String price;    

  Category.fromJSON(Map<String, dynamic> parsedJson) {    
    this.category = parsedJson['category'];    
    this.companyId = parsedJson['company_id'];    
    this.id = parsedJson['id'];    
    this.percentage = parsedJson['percentage'];    
    this.price = parsedJson['price'];    
  }
}