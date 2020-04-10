import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shui_chou/utils/myUtil.dart';

import 'commonWidget.dart';

class ForgetPwdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar("忘记密码"),
      body: Container(
        width: ScreenUtil.getScreenW(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: getAdapterDp(29),
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
              "新密码",
              obscureText: true,
            ),
            SizedBox(
              height: getAdapterDp(10),
            ),
            LoginMyInput(
              "确认新密码",
              obscureText: true,
            ),
            SizedBox(
              height: getAdapterDp(86),
            ),
            LoginSubmitButton("确认修改",()=>print("确认修改"))
          ],
        ),
      ),
    );
  }
}
