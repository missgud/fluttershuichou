import 'package:flutter/material.dart';
import 'package:shui_chou/utils/myUtil.dart';

abstract class MyRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    init();
    return Container();
  }

  void init(){
    // 初始化图片加载工具
    LoadImgUtil.init("home/");
  }
}
