import 'package:bloc_auth/pages/home_page.dart';
import 'package:bloc_auth/pages/login_page.dart';
import 'package:bloc_auth/pages/register_page.dart';
import 'package:bloc_auth/pages/splash_page.dart';
import 'package:flutter/material.dart';

const String kHomePage = '/home_page';
const String kLoginPage = '/login_page';
const String kRegister = '/register_page';
const String kSplashPage = '/';

Map<String, Function> routes = {
  kHomePage: (ctx) => SlideLeftRoute(widget: HomePage()),
  kLoginPage: (ctx) => SlideLeftRoute(widget: LoginPage()),
  kSplashPage: (ctx) => SlideLeftRoute(widget: SplashPage()),
  kRegister: (ctx) => SlideLeftRoute(widget: RegisterPage()),
};

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;

  SlideLeftRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
