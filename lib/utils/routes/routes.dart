import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resource/app_strings.dart';
import 'package:flutter_mvvm/utils/routes/route_name.dart';
import 'package:flutter_mvvm/view/home_screen.dart';
import 'package:flutter_mvvm/view/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return undefainedRoute();
    }
  }

  static Route<dynamic> undefainedRoute() {
    return MaterialPageRoute(builder: (_) => const Scaffold(
      body: Center(child: Text(AppStrings.noRoute)),
    ));
  }
}
