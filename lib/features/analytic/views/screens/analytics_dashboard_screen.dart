import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/analytic/models/analytic_data_model.dart';
import 'package:learning_app/features/analytic/views/widgets/learning_streak_card.dart';
import 'package:learning_app/features/analytic/views/widgets/recommendation_card.dart';
import 'package:learning_app/features/analytic/views/widgets/skill_progress_card.dart';
import 'package:learning_app/features/analytic/views/widgets/weekly_progress_card.dart';
import 'package:learning_app/services/analytics_service.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  AnalyticsDashboardScreen({super.key});

  final _analyticsService = AnalyticsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text(
          'Learning Analytics',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<AnalyticDataModel>(
        future: _analyticsService.getUserAnalytics('current_user_id'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final analytics = snapshot.data!;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LearningStreakCard(learningStreak: analytics.learningStreak),
                  const SizedBox(height: 20),
                  WeeklyProgressCard(weeklyProgress: analytics.weeklyProgress),
                  const SizedBox(height: 20),
                  SkillProgressCard(skillProgress: analytics.skillProgress),
                  const SizedBox(height: 20),
                  RecommendationCard(
                    recommendations: analytics.recommendations,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
