import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shui_chou/routers/home/ItemDetailsRoute.dart';
import 'package:shui_chou/routers/home/ItemMoreRoute.dart';
import 'package:shui_chou/routers/indexRoute.dart';
import 'package:shui_chou/routers/login/registerRoute.dart';
import 'login/forgetPwdRoute.dart';
import 'login/loginRoute.dart';

class Routes {
  static String root = '/';
  static String indexRoute = '/indexRoute';
  static String loginRoute = '/loginRoute';
  static String registerRoute = '/registerRoute';
  static String forgetPwdRoute = '/forgetPwdRoute';
  static String itemMoreRoute = '/home/itemMore';
  static String itemDetailsRoute = '/home/itemDetailsRoute';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      // ignore: missing_return
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
        print('找不到路由，404');
      },
    );

    // 路由页面配置
    router.define(Routes.forgetPwdRoute, handler: forgetPwdRouteHandler);
    router.define(loginRoute, handler: loginRouteHandler);
    router.define(registerRoute, handler: registerRouteHandler);
    router.define(indexRoute, handler: indexRouteHandler);
    router.define(itemMoreRoute, handler: itemMoreRouteHandler);
    router.define(itemDetailsRoute, handler: itemDetailsHandler);
  }
}

Handler loginRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginRoute();
});

Handler registerRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterRoute();
});

Handler forgetPwdRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ForgetPwdRoute();
  },
);

Handler indexRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexRoute();
});

Handler itemMoreRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ItemMoreRoute();
  },
);

Handler itemDetailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ItemDetailsRoute();
  },
);
