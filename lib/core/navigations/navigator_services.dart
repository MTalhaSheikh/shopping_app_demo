import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, Map<String, dynamic> arg) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arg);
  }
}