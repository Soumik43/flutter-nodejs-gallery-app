import 'package:flutter/material.dart';

import '../config/config.dart';
import '../screens/homescreen.dart';
import '../screens/imagepage.dart';
import '../screens/newpage.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  String name = settings.name ?? '/images';
  String newid = name.substring(name.lastIndexOf('/') + 1);
  if (name == Config.HomeRoute) {
    return _getPageRoute(const HomeScreen(), settings);
  } else if (name == Config.newImageRoute) {
    return _getPageRoute(const NewPage(), settings);
  } else if (name.contains(Config.showImage)) {
    return _getPageRoute(ImagePage(id: newid), settings);
  } else {
    return _getPageRoute(const HomeScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
