import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/teacher_analytics/views/widgets/analytics_overview.dart';
import 'package:learning_app/features/teacher_analytics/views/widgets/enrollment_chart.dart';
import 'package:learning_app/features/teacher_analytics/views/widgets/revenue_stats.dart';
import 'package:learning_app/features/teacher_analytics/views/widgets/student_engagement.dart';
import 'package:learning_app/features/teacher_analytics/views/widgets/teacher_analytics_app_bar.dart';

class TeacherAnalyticsScreen extends StatelessWidget {
  const TeacherAnalyticsScreen({super.key});

  final String instructorId = 'inst_1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          TeacherAnalyticsAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnalyticsOverview(instructorId: instructorId),
                  const SizedBox(height: 24),
                  EnrollmentChart(instructorId: instructorId),
                  const SizedBox(height: 24),
                  const RevenueStats(),
                  const SizedBox(height: 24),
                  StudentEngagement(instructorId: instructorId),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
