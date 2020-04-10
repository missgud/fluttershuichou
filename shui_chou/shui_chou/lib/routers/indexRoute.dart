import 'package:flutter/material.dart';
import 'package:shui_chou/routers/mine/mineRoute.dart';
import 'package:shui_chou/routers/work/WorkRoute.dart';
import 'package:shui_chou/utils/myUtil.dart';

import 'home/homeRoute.dart';

class IndexRoute extends StatefulWidget {
  @override
  _IndexRoute createState() => _IndexRoute();
}

class _IndexRoute extends State<IndexRoute> {
  var _bodies = [
    HomeRoute(),
    WorkRoute(),
    MineRoute(),
  ];
  var _appBarTitles = ['首页', '工作台', '我的'];
  var _tabSelectedIcon = [
    "icon_tab_home_yes.png",
    "icon_tab_work_yes.png",
    "icon_tab_mine_no.png"
  ];
  var _tabUnSelectIcon = [
    "icon_tab_home_no.png",
    "icon_tab_work_no.png",
    "icon_tab_mine_no.png"
  ];
  int _tabIndex = 0;

  var tabItems = <BottomNavigationBarItem>[];

  Widget getTabIcon(int index, String iconName) {
    return Image.asset(
      generateAssetPath("tab/$iconName"),
      width: getAdapterDp(22),
    );
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _appBarTitles.length; i++) {
      tabItems.add(BottomNavigationBarItem(
          activeIcon: getTabIcon(i, _tabSelectedIcon[i]),
          icon: getTabIcon(i, _tabUnSelectIcon[i]),
          title: Text(
            _appBarTitles[i],
            style: TextStyle(fontSize: getAdapterDp(12)),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar("首页"),
      body: _bodies[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
