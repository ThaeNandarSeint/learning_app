import 'package:get/get.dart';
import 'package:learning_app/features/auth/views/forgot_password_screen.dart';
import 'package:learning_app/features/auth/views/login_screen.dart';
import 'package:learning_app/features/auth/views/register_screen.dart';
import 'package:learning_app/features/course/views/screens/course_detail_screen.dart';
import 'package:learning_app/features/course/views/screens/course_list_screen.dart';
import 'package:learning_app/features/course/views/screens/my_course_list_screen.dart';
import 'package:learning_app/features/entry/views/screens/home_screen.dart';
import 'package:learning_app/features/entry/views/screens/main_screen.dart';
import 'package:learning_app/features/entry/views/screens/onboarding_screen.dart';
import 'package:learning_app/features/entry/views/screens/splash_screen.dart';
import 'package:learning_app/features/lesson/views/screens/lesson_detail_screen.dart';
import 'package:learning_app/features/notification/views/screens/notification_screen.dart';
import 'package:learning_app/features/payment/views/screens/payment_screen.dart';
import 'package:learning_app/features/quiz/models/quiz_attempt_model.dart';
import 'package:learning_app/features/quiz/models/quiz_model.dart';
import 'package:learning_app/features/quiz/views/screens/quiz_attempt_screen.dart';
import 'package:learning_app/features/quiz/views/screens/quiz_list_screen.dart';
import 'package:learning_app/features/quiz/views/screens/quiz_result_screen.dart';
import 'package:learning_app/features/teacher_home/views/screens/teacher_home_screen.dart';
import 'package:learning_app/features/user/views/screens/profile_screen.dart';
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
    GetPage(
      name: AppRoutes.courseList,
      page: () => CourseListScreen(
        categoryId: Get.arguments?['category'] as String?,
        categoryName: Get.arguments?['categoryName'] as String?,
      ),
    ),
    GetPage(
      name: AppRoutes.courseDetail,
      page: () => CourseDetailScreen(courseId: Get.parameters['id'] ?? ''),
    ),
    GetPage(
      name: AppRoutes.lessonDetail,
      page: () => LessonDetailScreen(lessonId: Get.parameters['id'] ?? ''),
    ),
    GetPage(name: AppRoutes.quizList, page: () => const QuizListScreen()),
    GetPage(
      name: AppRoutes.quizResult,
      page: () => QuizResultScreen(
        attempt: Get.arguments['attempt'] as QuizAttemptModel,
        quiz: Get.arguments['quiz'] as QuizModel,
      ),
    ),
    GetPage(
      name: AppRoutes.quizAttempt,
      page: () => QuizAttemptScreen(quizId: Get.parameters['id'] ?? ''),
    ),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentScreen(
        courseId: Get.arguments['courseId'] as String,
        courseName: Get.arguments['courseName'] as String,
        price: Get.arguments['price'] as double,
      ),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationScreen(),
    ),
    GetPage(name: AppRoutes.teacherHome, page: () => const TeacherHomeScreen()),
    GetPage(name: AppRoutes.myCourses, page: () => const MyCourseListScreen()),
  ];
}
