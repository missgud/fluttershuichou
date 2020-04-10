import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:shui_chou/provider/itemMoreProvider.dart';
import 'package:shui_chou/provider/loginProvider.dart';
import 'package:shui_chou/routers/application.dart';
import 'package:shui_chou/routers/indexRoute.dart';
import 'package:shui_chou/routers/login/loginRoute.dart';
import 'package:shui_chou/routers/routes.dart';
import 'package:shui_chou/utils/myUtil.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //路由初始化
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ItemMoreProvider()),
      ],
      child: MaterialApp(
          onGenerateRoute: Application.router.generator,
          title: "税筹平台",
          theme: ThemeData(primaryColor: parseColor("#2E91FF")),
          home: LoginRoute()),
    );
  }
}

//void main() => runApp(TestDemo());
//
//class TestDemo extends StatefulWidget {
//  @override
//  _TestDemoState createState() => _TestDemoState();
//}
//
//class _TestDemoState extends State<TestDemo> {
//  var _left = -100.0;
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(title: Text("aaa"),),
//        body: Stack(
//          children: <Widget>[
//            AnimatedPositioned(
//              duration: Duration(seconds: 1),
//              left: _left,
//              child: RaisedButton(
//                onPressed: () {
//                  if(_left < 100){
//                    _left = 100;
//                  }else{
//                    _left = -100.0;
//                  }
//                  setState(() {
//
//                  });
//                },
//                child: Text("AnimatedPositioned"),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
