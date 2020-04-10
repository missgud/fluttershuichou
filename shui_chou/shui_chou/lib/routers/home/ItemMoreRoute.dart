import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shui_chou/provider/itemMoreProvider.dart';
import 'package:shui_chou/utils/myUtil.dart';

import 'homeRoute.dart';

class ItemMoreRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar("接项目"),
      body: ItemMoreBody(),
    );
  }
}

class ItemMoreBody extends StatefulWidget {
  @override
  _ItemMoreBodyState createState() => _ItemMoreBodyState();
}

class _ItemMoreBodyState extends State<ItemMoreBody> {
  double _categoryViewStartLeft = getAdapterDp(360);

  @override
  Widget build(BuildContext context) {
    // 初始化图片加载工具
    LoadImgUtil.init("home/");
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          height: ScreenUtil.getScreenH(context),
          width: ScreenUtil.getScreenW(context),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getAdapterDp(10),
                        horizontal: getAdapterDp(15)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: getAdapterDp(1)),
                            height: getAdapterDp(35),
                            decoration: BoxDecoration(
                                color: parseColor("#F4F4F4"),
                                borderRadius:
                                    BorderRadius.circular(getAdapterDp(50))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      right: getAdapterDp(10),
                                      left: getAdapterDp(15),
                                      top: getAdapterDp(5)),
                                  child: LoadImgUtil.loadAssetImg(
                                      "icon_search.png", getAdapterDp(14)),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                        fontSize: getAdapterDp(12),
                                        color: parseColor("#AAAAAA")),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "请输入项目名称/项目邀请码进行搜索",
                                      hintStyle: TextStyle(
                                          fontSize: getAdapterDp(12),
                                          color: parseColor("#AAAAAA")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getAdapterDp(15),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_categoryViewStartLeft > 0) {
                                  _categoryViewStartLeft = 0;
                                } else {
                                  _categoryViewStartLeft = getAdapterDp(360);
                                }
                              });
                            },
                            child: LoadImgUtil.loadAssetImg(
                                "icon_select.png", getAdapterDp(20))),
                      ],
                    )),
              ),
              SizedBox(
                height: getAdapterDp(10),
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => SelectItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: getAdapterDp(5),
                ),
              )),
            ],
          ),
        ),
        // 分类选择项目
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          top: getAdapterDp(55),
          left: _categoryViewStartLeft,
          height: ScreenUtil.getScreenH(context),
          width: ScreenUtil.getScreenW(context),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: getAdapterDp(145),
                child: GridView.builder(
                    itemCount: Provider.of<ItemMoreProvider>(context)
                        .categoryList
                        .length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2.5, crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Provider.of<ItemMoreProvider>(context,
                                listen: false)
                            .selectCategory(index),
                        child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              Provider.of<ItemMoreProvider>(context)
                                  .categoryList[index]
                                  .title,
                              style: Provider.of<ItemMoreProvider>(context)
                                      .categoryList[index]
                                      .status
                                  ? TextStyle(
                                      fontSize: getAdapterDp(12),
                                      color: Theme.of(context).primaryColor)
                                  : TextStyle(
                                      fontSize: getAdapterDp(12),
                                      color: parseColor("#5F5F5F")),
                              textAlign: TextAlign.center,
                            )),
                      );
                    }),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _categoryViewStartLeft = getAdapterDp(360);
                    });
                  },
                  child: Container(
                    color: parseColor("#000000").withOpacity(0.25),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
