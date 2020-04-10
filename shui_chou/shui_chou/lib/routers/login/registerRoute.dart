import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shui_chou/utils/myUtil.dart';

import 'commonWidget.dart';

class RegisterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar("注册"),
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
              "请输入您的手机号",
              maxLength: 11,
            ),
            SizedBox(
              height: getAdapterDp(10),
            ),
            VerificationInput(),
            SizedBox(
              height: getAdapterDp(10),
            ),
            LoginMyInput(
              "请输入密码",
              obscureText: true,
            ),
            SizedBox(
              height: getAdapterDp(10),
            ),
            LoginMyInput(
              "请再次输入密码",
              obscureText: true,
            ),
            SizedBox(
              height: getAdapterDp(32),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getAdapterDp(30)),
              child: Row(
                children: <Widget>[
                  MyCheckBox(),
                  SizedBox(
                    width: getAdapterDp(4),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: getAdapterDp(2)),
                    child: Text(
                      "我已阅读并同意",
                      style: TextStyle(
                          color: parseColor("#A8A5A3"),
                          fontSize: getAdapterDp(12)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: getAdapterDp(2)),
                    child: Text(
                      "《用户协议和隐私条款》",
                      style: TextStyle(
                          color: parseColor("#666666"),
                          fontSize: getAdapterDp(12)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getAdapterDp(32),
            ),
            LoginSubmitButton("注册", () => print("注册"))
          ],
        ),
      ),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      child: checked
          ? Image.asset(
              generateAssetPath("login_check_on.png"),
              width: getAdapterDp(18),
              height: getAdapterDp(18),
            )
          : Image.asset(generateAssetPath("login_check_off.png"),
              width: getAdapterDp(18), height: getAdapterDp(18)),
    );
  }
}
