import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shui_chou/utils/myUtil.dart';

class ItemDetailsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化图片加载工具
    LoadImgUtil.init("home/");
    return Scaffold(
      appBar: generateAppBar("项目详情"),
      body: DetailsBody(),
    );
  }
}

class DetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: getAdapterDp(160),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: getAdapterDp(150),
                  child: ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  top: getAdapterDp(20),
                  left: getAdapterDp(15),
                  right: getAdapterDp(15),
                  height: getAdapterDp(140),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getAdapterDp(15)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(getAdapterDp(8))),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: getAdapterDp(20),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "SLEEPON",
                              style: TextStyle(
                                  fontSize: getAdapterDp(18),
                                  color: parseColor("#333333")),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            LoadImgUtil.loadAssetImg(
                                "icon_clock.png", getAdapterDp(14)),
                            SizedBox(
                              width: getAdapterDp(5),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(bottom: getAdapterDp(1)),
                                child: Text(
                                  "待签约",
                                  style: TextStyle(
                                      color: parseColor("#F7B500"),
                                      fontSize: getAdapterDp(12)),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: getAdapterDp(5),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "已签约人数：",
                              style: TextStyle(
                                  fontSize: getAdapterDp(12),
                                  color: parseColor("#5F5F5F")),
                            ),
                            Text(
                              "1人",
                              style: TextStyle(
                                  fontSize: getAdapterDp(12),
                                  color: parseColor("#5F5F5F")),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(bottom: getAdapterDp(1)),
                                child: Text(
                                  "1000元/人",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: getAdapterDp(12)),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: getAdapterDp(15),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: parseColor("#333333")),
                              width: getAdapterDp(2),
                              height: getAdapterDp(2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getAdapterDp(2),
                                  left: getAdapterDp(5)),
                              child: Text(
                                "招募人数：",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#AAAAAA")),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: getAdapterDp(2)),
                              child: Text(
                                "1人",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#5F5F5F")),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: parseColor("#333333")),
                              width: getAdapterDp(2),
                              height: getAdapterDp(2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getAdapterDp(2),
                                  left: getAdapterDp(5)),
                              child: Text(
                                "项目类型：",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#AAAAAA")),
                              ),
                            ),
                            Container(
                              width: getAdapterDp(70),
                              child: Text(
                                "1人",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#5F5F5F")),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: parseColor("#333333")),
                              width: getAdapterDp(2),
                              height: getAdapterDp(2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getAdapterDp(2),
                                  left: getAdapterDp(5)),
                              child: Text(
                                "开始时间：",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#AAAAAA")),
                              ),
                            ),
                            Text(
                              "2020-03-29",
                              style: TextStyle(
                                  fontSize: getAdapterDp(12),
                                  color: parseColor("#5F5F5F")),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: parseColor("#333333")),
                              width: getAdapterDp(2),
                              height: getAdapterDp(2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getAdapterDp(2),
                                  left: getAdapterDp(5)),
                              child: Text(
                                "截止时间：",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#AAAAAA")),
                              ),
                            ),
                            Container(
                              width: getAdapterDp(70),
                              child: Text(
                                "2020-06-29",
                                style: TextStyle(
                                    fontSize: getAdapterDp(12),
                                    color: parseColor("#5F5F5F")),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getAdapterDp(20),
          ),
          Container(
              padding: EdgeInsets.only(left: getAdapterDp(15)),
              alignment: Alignment.centerLeft,
              child: Text(
                "业务需求",
                style: TextStyle(
                    color: parseColor("#333333"),
                    fontSize: getAdapterDp(18),
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: getAdapterDp(10),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getAdapterDp(15)),
            height: getAdapterDp(120),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Text(
                    "${index + 1} 、担任助教，负责相应课程教授；担任助教，",
                    style: TextStyle(
                        color: parseColor("#333333"),
                        fontSize: getAdapterDp(12)),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: getAdapterDp(10),
                    ),
                itemCount: 4),
          ),
          SizedBox(
            height: getAdapterDp(20),
          ),
          Container(
            width: ScreenUtil.getScreenW(context),
            height: getAdapterDp(90),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => LoadImgUtil.loadAssetImg(
                    "img_details1.png", getAdapterDp(120)),
                separatorBuilder: (context, index) => SizedBox(
                      width: getAdapterDp(8),
                    ),
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
