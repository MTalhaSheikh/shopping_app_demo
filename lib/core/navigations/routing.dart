import 'package:flutter/material.dart';
import 'package:online_shop_app_demo/features/number_trivia/data/data_sources/local_data/commen/constants.dart';
import '../../features/number_trivia/presentation/pages/dashboard_page.dart';
import '../../features/number_trivia/presentation/pages/selected_cart_items_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Object? data = args;
    switch (settings.name) {
      case Constants.dashboardScreen:
      return MaterialPageRoute(builder: (_) => const DashboardPage());

      case Constants.selectedCartItemPage:
        return MaterialPageRoute(builder: (_) => const SelectedCartItemPage());

      default:
        return _errorRoute(settings.name);
    }
  }
  static Route<dynamic> _errorRoute(pageName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.error_outline),
              Text(
                "Error in route to Dashboard",
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
      );
    });
  }
}