import 'package:flutter/material.dart';
import 'package:learning_app/features/auth/views/forgot_password_screen.dart';
import 'package:learning_app/features/auth/views/login_screen.dart';
import 'package:learning_app/features/auth/views/register_screen.dart';
import 'package:learning_app/features/course/views/screens/course_detail_screen.dart';
import 'package:learning_app/features/course/views/screens/course_list_screen.dart';
import 'package:learning_app/features/entry/views/screens/home_screen.dart';
import 'package:learning_app/features/entry/views/screens/main_screen.dart';
import 'package:learning_app/features/entry/views/screens/onboarding_screen.dart';
import 'package:learning_app/features/entry/views/screens/splash_screen.dart';
import 'package:learning_app/features/entry/views/screens/teacher_home_screen.dart';
import 'package:learning_app/features/lesson/views/screens/lesson_detail_screen.dart';
import 'package:learning_app/features/payment/views/screens/payment_screen.dart';
import 'package:learning_app/features/quiz/views/screens/quiz_attempt_screen.dart';
import 'package:learning_app/features/quiz/views/screens/quiz_list_screen.dart';
import 'package:learning_app/features/user/views/screens/profile_screen.dart';

class AppRoutes {
  // main routes
  static const String main = '/main';

  // auth routes
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';

  // course routes
  static const String courseList = '/courses';
  static const String courseDetail = '/courses/:id';

  // lesson routes
  static const String lessonDetail = '/lessons/:id';

  // quiz routes
  static const String quizList = '/quizzes';
  static const String quizAttempt = '/quizzes/:id';

  // profile routes
  static const String profile = '/profile';

  // payment routes
  static const String payment = '/payment';

  // teacher routes
  static const String teacherHome = '/teacher/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case main:
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            initialIndex: settings.arguments is Map
                ? (settings.arguments as Map<String, dynamic>)['initialIndex']
                      as int?
                : null,
          ),
        );

      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case courseList:
        return MaterialPageRoute(
          builder: (_) {
            final args = settings.arguments as Map<String, dynamic>?;
            return CourseListScreen(
              categoryId: args?['category'] as String,
              categoryName: args?['categoryName'] as String,
            );
          },
        );

      case courseDetail:
        String courseId;
        if (settings.arguments != null) {
          courseId = settings.arguments as String;
        } else {
          final uri = Uri.parse(settings.name ?? '');
          courseId = uri.pathSegments.last;
        }
        return MaterialPageRoute(
          builder: (_) => CourseDetailScreen(courseId: courseId),
        );

      case lessonDetail:
        final lessonId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => LessonDetailScreen(lessonId: lessonId ?? ''),
        );

      case quizList:
        return MaterialPageRoute(builder: (_) => const QuizListScreen());

      case quizAttempt:
        final quizId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => QuizAttemptScreen(quizId: quizId ?? ''),
        );

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case payment:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(
            courseId: args['courseId'] ?? '',
            courseName: args['courseName'] ?? '',
            price: args['price'] ?? 0.0,
          ),
        );

      case teacherHome:
        return MaterialPageRoute(builder: (_) => const TeacherHomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
