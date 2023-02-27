import 'package:flutter/material.dart';

class GlobalUtil {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static var context = GlobalUtil.navigationKey.currentContext;

  static var screenWidth =
      MediaQuery.of(GlobalUtil.navigationKey.currentContext!).size.width;
  static var screenHeight =
      MediaQuery.of(GlobalUtil.navigationKey.currentContext!).size.height;
  static var statusBarHeight =
      MediaQuery.of(GlobalUtil.navigationKey.currentContext!).padding.top;
  static var bottomSpace =
      MediaQuery.of(GlobalUtil.navigationKey.currentContext!).padding.bottom;
}
