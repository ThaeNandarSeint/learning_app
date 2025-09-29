import 'package:learning_app/features/analytic/models/analytic_data_model.dart';

class AnalyticsService {
  Future<AnalyticDataModel> getUserAnalytics(String userId) async {
    return AnalyticDataModel(
      completionRate: 0.72,
      totalTimeSpent: 4320,
      averageQuizScore: 88.5,
      skillProgress: {
        'Flutter': 0.85,
        "Dart": 0.75,
        "UI Design": 0.68,
        "State Management": 0.62,
        "Testing": 0.45,
      },
      recommendations: [
        'Complete "Advanced State Management" to improve app architecture skills',
        'Take the UI/UX Design workshop to enhance your design capabilities',
        'Practice more Flutter testing to increase your test coverage skills',
      ],
      weeklyProgress: [
        WeeklyProgressModel(day: 'Mon', minutes: 45),
        WeeklyProgressModel(day: 'Tue', minutes: 60),
        WeeklyProgressModel(day: 'Wed', minutes: 30),
        WeeklyProgressModel(day: 'Thu', minutes: 75),
        WeeklyProgressModel(day: 'Fri', minutes: 50),
        WeeklyProgressModel(day: 'Sat', minutes: 90),
        WeeklyProgressModel(day: 'Sun', minutes: 40),
      ],
      learningStreak: {'current': 5, 'longest': 12, 'total': 45},
      totalCoursesEnrolled: 8,
      certificatesEarned: 3,
    );
  }

  Future<AnalyticDataModel> updateCourseProgress(
    String userId,
    String courseId,
    double progress,
    AnalyticDataModel currentAnalytics,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AnalyticDataModel(
      completionRate: (currentAnalytics.completionRate + progress) / 2,
      totalTimeSpent: currentAnalytics.totalTimeSpent + 30,
      averageQuizScore: currentAnalytics.averageQuizScore,
      skillProgress: currentAnalytics.skillProgress,
      recommendations: currentAnalytics.recommendations,
      weeklyProgress: currentAnalytics.weeklyProgress,
      learningStreak: currentAnalytics.learningStreak,
      totalCoursesEnrolled: currentAnalytics.totalCoursesEnrolled,
      certificatesEarned: currentAnalytics.certificatesEarned,
    );
  }

  Future<AnalyticDataModel> updateQuizScore(
    String userId,
    String quizId,
    double score,
    AnalyticDataModel currentAnalytics,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AnalyticDataModel(
      completionRate: currentAnalytics.completionRate,
      totalTimeSpent: currentAnalytics.totalTimeSpent,
      averageQuizScore: (currentAnalytics.averageQuizScore + score) / 2,
      skillProgress: currentAnalytics.skillProgress,
      recommendations: currentAnalytics.recommendations,
      weeklyProgress: currentAnalytics.weeklyProgress,
      learningStreak: currentAnalytics.learningStreak,
      totalCoursesEnrolled: currentAnalytics.totalCoursesEnrolled,
      certificatesEarned: currentAnalytics.certificatesEarned,
    );
  }

  Future<AnalyticDataModel> updateLearningStreak(
    String userId,
    AnalyticDataModel currentAnalytics,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final currentStreak = currentAnalytics.learningStreak['current']! + 1;
    final longestStreak =
        currentStreak > currentAnalytics.learningStreak['longest']!
        ? currentStreak
        : currentAnalytics.learningStreak['longest'];

    return AnalyticDataModel(
      completionRate: currentAnalytics.completionRate,
      totalTimeSpent: currentAnalytics.totalTimeSpent,
      averageQuizScore: currentAnalytics.averageQuizScore,
      skillProgress: currentAnalytics.skillProgress,
      recommendations: currentAnalytics.recommendations,
      weeklyProgress: currentAnalytics.weeklyProgress,
      learningStreak: {
        'current': currentStreak,
        'longest': ?longestStreak,
        'total': currentAnalytics.learningStreak['total']! + 1,
      },
      totalCoursesEnrolled: currentAnalytics.totalCoursesEnrolled,
      certificatesEarned: currentAnalytics.certificatesEarned,
    );
  }

  Future<AnalyticDataModel> updateSkillProgress(
    String userId,
    String skillName,
    double progress,
    AnalyticDataModel currentAnalytics,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final updatedSkillProgress = Map<String, double>.from(
      currentAnalytics.skillProgress,
    );
    updatedSkillProgress[skillName] = progress;

    return AnalyticDataModel(
      completionRate: currentAnalytics.completionRate,
      totalTimeSpent: currentAnalytics.totalTimeSpent,
      averageQuizScore: currentAnalytics.averageQuizScore,
      skillProgress: currentAnalytics.skillProgress,
      recommendations: currentAnalytics.recommendations,
      weeklyProgress: currentAnalytics.weeklyProgress,
      learningStreak: currentAnalytics.learningStreak,
      totalCoursesEnrolled: currentAnalytics.totalCoursesEnrolled,
      certificatesEarned: currentAnalytics.certificatesEarned,
    );
  }

  Future<AnalyticDataModel> completeLesson(
    String userId,
    String courseId,
    String lessonId,
    AnalyticDataModel currentAnalytics,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AnalyticDataModel(
      completionRate: currentAnalytics.completionRate + 0.05,
      totalTimeSpent: currentAnalytics.totalTimeSpent + 45,
      averageQuizScore: currentAnalytics.averageQuizScore,
      skillProgress: currentAnalytics.skillProgress,
      recommendations: currentAnalytics.recommendations,
      weeklyProgress: currentAnalytics.weeklyProgress,
      learningStreak: currentAnalytics.learningStreak,
      totalCoursesEnrolled: currentAnalytics.totalCoursesEnrolled,
      certificatesEarned: currentAnalytics.certificatesEarned,
    );
  }

  Future<AnalyticDataModel> earnCertificate(
    String userId,
    String courseId,
    AnalyticDataModel currentAnalytics,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AnalyticDataModel(
      completionRate: currentAnalytics.completionRate,
      totalTimeSpent: currentAnalytics.totalTimeSpent,
      averageQuizScore: currentAnalytics.averageQuizScore,
      skillProgress: currentAnalytics.skillProgress,
      recommendations: currentAnalytics.recommendations,
      weeklyProgress: currentAnalytics.weeklyProgress,
      learningStreak: currentAnalytics.learningStreak,
      totalCoursesEnrolled: currentAnalytics.totalCoursesEnrolled,
      certificatesEarned: currentAnalytics.certificatesEarned + 1,
    );
  }
}
