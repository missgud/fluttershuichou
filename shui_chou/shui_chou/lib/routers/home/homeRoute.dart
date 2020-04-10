import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shui_chou/routers/navigator_util.dart';
import 'package:shui_chou/utils/myUtil.dart';
import '../commonWidget.dart';
import '../routes.dart';

final smallTextL =
    TextStyle(color: parseColor("#AAAAAA"), fontSize: getAdapterDp(12));
final smallTextV =
    TextStyle(color: parseColor("#333333"), fontSize: getAdapterDp(12));
final normalText =
    TextStyle(color: parseColor("#333333"), fontSize: getAdapterDp(14));

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化图片加载工具
    LoadImgUtil.init("home/");

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopBanner(),
            FrameTitleRow("精选项目"),
            SelectItem(),
            SizedBox(
              height: getAdapterDp(10),
            ),
            SelectItem(),
            SizedBox(
              height: getAdapterDp(20),
            ),
            FrameTitleRow("最新资讯"),
            NewsItem(),
            NewsItem(),
            NewsItem(),
          ],
        ),
      ),
    );
  }
}

// 头部轮播图
class TopBanner extends StatelessWidget {
  final bannerName = ["banner1.png", "banner2.png", "banner3.png"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getScreenW(context),
      height: getAdapterDp(170),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 110,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                color: Theme.of(context).primaryColor,
                height: getAdapterDp(110),
              ),
            ),
          ),
          Positioned(
            left: getAdapterDp(10),
            right: getAdapterDp(10),
            child: Container(
              height: getAdapterDp(170),
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                      generateAssetPath("banner/${bannerName[index]}"));
                },
                itemCount: 3,
                pagination: SwiperPagination(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 精选项目单项
class SelectItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>NavigatorUtil.goUseCupertino(context, Routes.itemDetailsRoute),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: getAdapterDp(10)),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0xff2E91FF).withOpacity(0.08),
                    blurRadius: getAdapterDp(2),
                    spreadRadius: getAdapterDp(1),
                    offset: Offset(0, getAdapterDp(2))),
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(getAdapterDp(12)),
                  bottomRight: Radius.circular(getAdapterDp(12)))),
          margin: EdgeInsets.symmetric(horizontal: getAdapterDp(10)),
          height: getAdapterDp(125),
          width: ScreenUtil.getScreenW(context),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: getAdapterDp(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "线上教育培训推广",
                    style: normalText,
                  ),
                  Text(
                    "¥1000/人",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: getAdapterDp(12)),
                  ),
                ],
              ),
              SizedBox(
                height: getAdapterDp(5),
              ),
              CardRow("项目类型：", "教育培训", "已签约人数：", "40人"),
              SizedBox(
                height: getAdapterDp(5),
              ),
              CardRow("周期：", "2020-03-20至2020-06-20", "所需人数：", "40人"),
              SizedBox(
                height: getAdapterDp(10),
              ),
              DashSeparator(
                color: parseColor("#E0E0E0"),
                width: getAdapterDp(3),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    LoadImgUtil.loadAssetImg("icon_address.png", getAdapterDp(26)),
                    SizedBox(
                      width: getAdapterDp(10),
                    ),
                    Text(
                      "上海明澈科技有限公司",
                      style: smallTextV,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "2020-02-29",
                      style: smallTextV,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

// 卡片中的一行布局
class CardRow extends StatelessWidget {
  final String leftLabel;
  final String leftValue;
  final String rightLabel;
  final String rightValue;

  CardRow(this.leftLabel, this.leftValue, this.rightLabel, this.rightValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          leftLabel,
          style: smallTextL,
        ),
        SizedBox(
          width: getAdapterDp(5),
        ),
        Text(
          leftValue,
          style: smallTextV,
        ),
        Expanded(
          child: SizedBox(),
        ),
        Text(
          rightLabel,
          style: smallTextL,
        ),
        SizedBox(
          width: getAdapterDp(5),
        ),
        Text(
          rightValue,
          style: smallTextV,
        )
      ],
    );
  }
}

// 每一个布局头部项目
class FrameTitleRow extends StatelessWidget {
  final String title;

  FrameTitleRow(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getAdapterDp(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: parseColor("#333333"),
                fontSize: getAdapterDp(18),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: ()=>NavigatorUtil.goUseCupertino(context, Routes.itemMoreRoute),
            child: Text(
              "查看更多",
              style: smallTextL,
            ),
          ),
        ],
      ),
    );
  }
}

// 最新资讯单项目
class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getAdapterDp(15)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: getAdapterDp(20),
          ),
          Row(
            children: <Widget>[
              LoadImgUtil.loadAssetImg("news_img2.png", getAdapterDp(120)),
              SizedBox(
                width: getAdapterDp(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: getAdapterDp(200),
                      child: Text(
                        "如何制定合理的避税方案，为自己创造更多财富?",
                        style: normalText,
                      )),
                  SizedBox(height: getAdapterDp(15),),
                  Row(
                    children: <Widget>[
                      LoadImgUtil.loadAssetImg("icon_clock.png", getAdapterDp(14)),
                    SizedBox(width: getAdapterDp(5),),
                    Text("2020-03-20",style: smallTextL,)
                  ],)
                ],
              ),
            ],
          ),
          SizedBox(
            height: getAdapterDp(5),
          ),
          Divider()
        ],
      ),
    );
  }
}
