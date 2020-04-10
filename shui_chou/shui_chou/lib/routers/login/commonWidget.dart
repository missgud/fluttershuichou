import 'package:flutter/material.dart';
import 'package:shui_chou/utils/myUtil.dart';

// 普通输入框
class LoginMyInput extends StatelessWidget {
  final String _hintText;
  final TextInputType _textInputType;
  final int _maxLength;
  final bool _obscureText;

  LoginMyInput(this._hintText,
      {inputType: TextInputType.phone, maxLength: 30, obscureText: false})
      : _textInputType = inputType,
        _maxLength = maxLength,
        _obscureText = obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: getAdapterDp(31)),
          child: TextField(
            obscureText: _obscureText,
            maxLength: _maxLength,
            keyboardType: _textInputType,
            decoration: InputDecoration(
              counter: Container(),
              hintText: _hintText,
              hintStyle: TextStyle(
                  fontSize: getAdapterDp(14), color: parseColor("#A8A5A3")),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: getAdapterDp(14)),
          ),
        ),
        Divider()
      ],
    );
  }
}

// 底部通用提交按钮
class LoginSubmitButton extends StatelessWidget {
  final String _text;
  final VoidCallback _onPress;

  LoginSubmitButton(this._text, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getAdapterDp(313),
      height: getAdapterDp(51),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getAdapterDp(4))),
        child: Text(
          _text,
          style: TextStyle(color: Colors.white, fontSize: getAdapterDp(16)),
        ),
        onPressed: _onPress,
        color: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }
}

// 验证码输入框
class VerificationInput extends StatelessWidget {
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
                    decoration: InputDecoration(
                      hintText: "请输入验证码",
                      hintStyle: TextStyle(
                          fontSize: getAdapterDp(14),
                          color: parseColor("#A8A5A3")),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: getAdapterDp(14)),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: getAdapterDp(68),
                    height: getAdapterDp(25),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: parseColor("#E0E0E0"),
                            width: getAdapterDp(0.5)),
                        borderRadius: BorderRadius.circular(getAdapterDp(2))),
                    child: Center(
                      child: Text(
                        "获取验证码",
                        style: TextStyle(
                            fontSize: getAdapterDp(12),
                            color: parseColor("#A8A5A3")),
                      ),
                    ),
                  ),
                  onTap: () {
                    print("点击发送验证码");
                  },
                )
              ],
            )),
        Divider(),
      ],
    );
  }
}

// 分割线
class Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getAdapterDp(17)),
      height: getAdapterDp(0.5),
      color: parseColor("#E0E0E0"),
    );
  }
}
