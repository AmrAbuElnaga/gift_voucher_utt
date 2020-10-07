import 'package:giftvoucher/Network/Api_Router.dart';
import 'package:giftvoucher/Network/Apiclient.dart';
import 'package:giftvoucher/auth/forget_pass/ui/forget_pass.dart';
import 'package:giftvoucher/auth/verfication_code/ui/verfication_code.dart';

class Api_Call {
  Api_Router _Api_Router = Api_Router();

  ///LOGIN
  Future<dynamic> login(String username, String password) async {
    print('wd778${Apiclient.login}');
    final Map<String, String> someMap = {
      "email": username,
      "password": password,
    };

    print('map_is${someMap}');

    return await _Api_Router.Perform_Request_post(
        '${Apiclient.login}', someMap);
  }

  ///SIGNUP
  Future<dynamic> signup(String username, String password, String phone,
      String role, String email, String tax) async {
    print('wd778${Apiclient.sign_up}');
    final Map<String, String> someMap = {
      "username": username,
      "password": password,
      "role": role,
      "phone": phone,
      "email": email,
      "tax": tax,
    };

    print('map_is${someMap}');

    return await _Api_Router.Perform_Request_post(
        '${Apiclient.sign_up}', someMap);
  }

  ///FORGET
  Future<dynamic> forget_pass(String email) async {
    final Map<String, String> someMap = {
      "email": email,
    };

    return await _Api_Router.Perform_Request_post(
        '${Apiclient.forget_pass}', someMap);
  }

  ///VERIFCATION CODE
  Future<dynamic> verfication_code(String code) async {
    return await _Api_Router.Perform_Request('${Apiclient.RESET_PASS}$code');
  }

  ///CHANGE NEW PASS
  Future<dynamic> resetMyPass(
      String code, String pass, String email, String coPass) async {
    final Map<String, String> someMap = {
      "code": code,
      "email": email,
      "password": pass,
      "password_confirmation": coPass,
    };

    return await _Api_Router.Perform_Request_post(
        '${Apiclient.changeNewPass}', someMap);
  }
}
