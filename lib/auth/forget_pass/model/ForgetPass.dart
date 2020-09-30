// To parse this JSON data, do
//
//     final forgetPass = forgetPassFromJson(jsonString);

import 'dart:convert';

ForgetPass forgetPassFromJson(String str) => ForgetPass.fromJson(json.decode(str));

String forgetPassToJson(ForgetPass data) => json.encode(data.toJson());

class ForgetPass {
  ForgetPass({
    this.status,
    this.message,
    this.body,
  });

  int status;
  String message;
  dynamic body;

  factory ForgetPass.fromJson(Map<String, dynamic> json) => ForgetPass(
    status: json["status"],
    message: json["message"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "body": body,
  };
}
