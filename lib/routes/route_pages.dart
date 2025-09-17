import 'package:get/get.dart';
import 'package:learning_app/features/splash/views/screens/splash_screen.dart';
import 'package:learning_app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  ];
}
