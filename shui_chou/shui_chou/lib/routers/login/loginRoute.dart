import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shui_chou/provider/loginProvider.dart';
import 'package:shui_chou/routers/navigator_util.dart';
import 'package:shui_chou/routers/routes.dart';
import 'package:shui_chou/utils/myUtil.dart';

import 'commonWidget.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar("${Provider.of<LoginProvider>(context).title}"),
      body: Container(
        width: ScreenUtil.getScreenW(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: getAdapterDp(29),
            ),
            Image.asset(
              generateAssetPath("login_title.png"),
              width: getAdapterDp(222),
            ),
            SizedBox(
              height: getAdapterDp(42),
            ),
            LoginMyInput(
              "手机号",
              maxLength: 11,
            ),
            SizedBox(
              height: getAdapterDp(30),
            ),
            PasswordOrVerification(),
            SizedBox(
              height: getAdapterDp(38),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getAdapterDp(30)),
              child: Row(
                children: <Widget>[
                  Text(
                    "登录即表示同意",
                    style: TextStyle(
                        color: parseColor("#A8A5A3"),
                        fontSize: getAdapterDp(12)),
                  ),
                  Text(
                    "《用户服务协议》《隐私权政策》",
                    style: TextStyle(
                        color: parseColor("#666666"),
                        fontSize: getAdapterDp(12)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getAdapterDp(27),
            ),
            LoginSubmitButton(
              "登录",
              () => NavigatorUtil.goToHomeRemovePage(context),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "还没有帐号？",
                  style: TextStyle(
                      color: parseColor("#666666"), fontSize: getAdapterDp(14)),
                ),
                InkWell(
                  child: Text(
                    "立即注册",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: getAdapterDp(14)),
                  ),
                  onTap: () => NavigatorUtil.goUseCupertino(
                      context, Routes.registerRoute),
                ),
              ],
            ),
            SizedBox(
              height: getAdapterDp(44),
            )
          ],
        ),
      ),
    );
  }
}

// 输入密码框
class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  var _isShow = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: getAdapterDp(31)),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    obscureText: _isShow,
                    decoration: InputDecoration(
                      hintText: "密码",
                      hintStyle: TextStyle(
                          fontSize: getAdapterDp(14),
                          color: parseColor("#A8A5A3")),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: getAdapterDp(14)),
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    _isShow
                        ? generateAssetPath("login_eye_off.png")
                        : generateAssetPath("login_eye_on.png"),
                    width: getAdapterDp(18),
                  ),
                  onTap: () {
                    setState(() {
                      _isShow = !_isShow;
                    });
                  },
                )
              ],
            )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: getAdapterDp(17)),
          height: getAdapterDp(0.5),
          color: parseColor("#E0E0E0"),
        ),
      ],
    );
  }
}

// 密码登录或者验证码登录
class PasswordOrVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        switch (provider.loginType) {
          case LoginType.VERIFICATION:
            return VerificationLogin();
            break;
          default:
            return PasswordLogin();
            break;
        }
      },
    );
  }
}

class PasswordLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PasswordInput(),
        SizedBox(
          height: getAdapterDp(16),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: getAdapterDp(30)),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  "忘记密码",
                  style: TextStyle(
                      color: parseColor("#666666"), fontSize: getAdapterDp(12)),
                ),
                onTap: () => NavigatorUtil.goUseCupertino(
                    context, Routes.forgetPwdRoute),
              ),
              Expanded(
                child: Container(),
              ),
              Consumer<LoginProvider>(
                builder: (context, provider, _) {
                  return GestureDetector(
                    onTap: () {
                      provider.switchLoginType(LoginType.VERIFICATION);
                    },
                    child: Text(
                      "验证码登录",
                      style: TextStyle(
                          color: parseColor("#666666"),
                          fontSize: getAdapterDp(12)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VerificationLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VerificationInput(),
        SizedBox(
          height: getAdapterDp(16),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: getAdapterDp(30)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Consumer<LoginProvider>(
                builder: (context, provider, _) {
                  return GestureDetector(
                    onTap: () {
                      provider.switchLoginType(LoginType.PASSWORD);
                    },
                    child: Text(
                      "密码登录",
                      style: TextStyle(
                          color: parseColor("#666666"),
                          fontSize: getAdapterDp(12)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
