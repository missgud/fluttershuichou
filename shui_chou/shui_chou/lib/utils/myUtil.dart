import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

AppBar generateAppBar(String title) => AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: getAdapterDp(18)),
      ),
    );

double getAdapterDp(double dp) {
  return ScreenUtil.getInstance().getAdapterSize(dp);
}

String generateAssetPath(String url, {suffixPath: "images/"}) {
  return "$suffixPath$url";
}

Color parseColor(String value) {
  return Color(int.parse("0xFF" + value.substring(1)));
}

// 加载本地图片类
class LoadImgUtil {
  static String _imgDirPath;

  static init(String dirPath) {
    _imgDirPath = dirPath;
  }

  static Widget loadAssetImg(String imgName, double imgWidth,
      {String prePath}) {
    if (prePath == null) {
      return Image.asset(
        generateAssetPath(_imgDirPath + imgName),
        width: imgWidth,
      );
    } else {
      return Image.asset(
        generateAssetPath(_imgDirPath + prePath + imgName),
        width: imgWidth,
      );
    }
  }
}
