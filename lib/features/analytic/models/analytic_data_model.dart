class AnalyticDataModel {
  final double completionRate;
  final int totalTimeSpent;
  final double averageQuizScore;
  final Map<String, double> skillProgress;
  final List<String> recommendations;
  final List<WeeklyProgressModel> weeklyProgress;
  final Map<String, int> learningStreak;
  final int totalCoursesEnrolled;
  final int certificatesEarned;

  AnalyticDataModel({
    required this.completionRate,
    required this.totalTimeSpent,
    required this.averageQuizScore,
    required this.skillProgress,
    required this.recommendations,
    required this.weeklyProgress,
    required this.learningStreak,
    required this.totalCoursesEnrolled,
    required this.certificatesEarned,
  });

  factory AnalyticDataModel.fromJson(Map<String, dynamic> json) {
    return AnalyticDataModel(
      completionRate: json['completionRate'] ?? 0.0,
      totalTimeSpent: json['totalTimeSpent'] ?? 0,
      averageQuizScore: json['averageQuizScore'] ?? 0.0,
      skillProgress: Map<String, double>.from(json['skillProgress'] ?? {}),
      recommendations: List<String>.from(json['recommendations'] ?? []),
      weeklyProgress: List<WeeklyProgressModel>.from(
        json['weeklyProgress']?.map(
          (e) => WeeklyProgressModel(day: e['day'], minutes: e['minutes']),
        ),
      ),
      learningStreak: Map<String, int>.from(json['learningStreak'] ?? {}),
      totalCoursesEnrolled: json['totalCoursesEnrolled'] ?? 0,
      certificatesEarned: json['certificatesEarned'] ?? 0,
    );
  }
}

class WeeklyProgressModel {
  final String day;
  final int minutes;

  WeeklyProgressModel({required this.day, required this.minutes});
}
