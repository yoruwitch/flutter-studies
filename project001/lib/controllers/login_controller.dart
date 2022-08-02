import 'package:flutter/cupertino.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  String? _password;

  setLogin(String value) => _login = value;
  setPassword(String value) => _password = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;
    return _login == 'admin' && _password == '123';
  }
}
