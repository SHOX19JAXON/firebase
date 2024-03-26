import 'package:firebase/screens/splash/sples_screen.dart';
import 'package:firebase/screens/tabs/notification/notification.dart';
import 'package:firebase/screens/tabs/tab_screen.dart';
import 'package:flutter/material.dart';


import 'auth_screens/login_screen.dart';
import 'auth_screens/register_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());

      case RouteNames.notification:
        return navigate(  Notification1());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
  static const String notification = "/notification";
}
