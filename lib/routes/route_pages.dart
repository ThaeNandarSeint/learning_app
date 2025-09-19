import 'package:get/get.dart';
import 'package:learning_app/features/auth/views/forgot_password_screen.dart';
import 'package:learning_app/features/auth/views/login_screen.dart';
import 'package:learning_app/features/auth/views/register_screen.dart';
import 'package:learning_app/features/course/views/course_list_screen.dart';
import 'package:learning_app/features/entry/views/screens/home_screen.dart';
import 'package:learning_app/features/entry/views/screens/main_screen.dart';
import 'package:learning_app/features/entry/views/screens/onboarding_screen.dart';
import 'package:learning_app/features/entry/views/screens/splash_screen.dart';
import 'package:learning_app/features/entry/views/screens/teacher_home_screen.dart';
import 'package:learning_app/features/quiz/views/quiz_list_screen.dart';
import 'package:learning_app/features/user/views/profile_screen.dart';
import 'package:learning_app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(
        initialIndex: Get.arguments is Map<String, dynamic>
            ? Get.arguments['initialIndex'] as int?
            : null,
      ),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.courseList, page: () => const CourseListScreen()),
    GetPage(name: AppRoutes.quizList, page: () => const QuizListScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.teacherHome, page: () => const TeacherHomeScreen()),
  ];
}
