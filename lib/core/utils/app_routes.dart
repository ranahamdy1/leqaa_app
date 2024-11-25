import 'package:flutter/cupertino.dart';

class AppRoutes {
  AppRoutes._();

  static Future<T?> routeTo<T>(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future<T?> routeAndRemoveTo<T>(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future<T?> routeAndRemoveAllTo<T>(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => page),
          (route) => false,
    );
  }

  static void pop(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }
}

class AppNavigator {
  AppNavigator._();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentContext!;
}
