import 'package:financialui/view/screens/account/account_screen.dart';
import 'package:financialui/view/screens/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:financialui/view/screens/splash/splash_screen.dart';

import '../view/screens/dashboard/dashboard_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String main = '/main';
  static const String account = '/account';
  static const String history = '/history';

  static String getInitialRoute() => '$initial';
  static String getSplashRoute() => '$splash';
  static String getAccountRoute() => '$account';
  static String getHistoryRoute() => '$history';
  static String getMainRoute(String page) => '$main?page=$page';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(DashboardScreen(pageIndex: 0))),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: account,
      page: () => AccountScreen(),
    ),
    GetPage(
      name: history,
      page: () => HistoryScreen(),
    ),
    GetPage(
        name: main,
        page: () => getRoute(DashboardScreen(
              pageIndex: Get.parameters['page'] == 'home'
                  ? 0
                  : Get.parameters['page'] == 'explore'
                      ? 1
                      : Get.parameters['page'] == 'history'
                          ? 2
                          : Get.parameters['page'] == 'account'
                              ? 3
                              : 0,
            ))),
  ];

  static getRoute(Widget navigateTo) {
    return navigateTo;
  }
}
