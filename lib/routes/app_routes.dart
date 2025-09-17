import 'package:flutter/material.dart';
import 'package:learning_app/features/splash/views/screens/splash_screen.dart';

class AppRoutes {
  // auth routes
  static const String splash = '/splash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
