import 'package:flutter/foundation.dart';

enum LoginType { PASSWORD, VERIFICATION }

class LoginProvider with ChangeNotifier{
  LoginType _loginType = LoginType.PASSWORD;

  LoginType get loginType => _loginType;

  String _title = "密码登录";

  String get title => _title;

  void switchLoginType(LoginType loginType){
    if(loginType == LoginType.PASSWORD){
      _title = "密码登录";
    }else{
      _title = "验证码登录";
    }
    _loginType = loginType;
    notifyListeners();
  }
}