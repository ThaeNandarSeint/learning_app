import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';

class QuizScoreCard extends StatelessWidget {
  const QuizScoreCard({
    super.key,
    required this.percentage,
    required this.isPassed,
  });

  final int percentage;
  final bool isPassed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha((0.1 * 255).round()),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            isPassed ? "Congratulations!" : 'Keep Practicing!',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '$percentage%',
            style: theme.textTheme.displayLarge?.copyWith(
              color: isPassed ? Colors.green : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Score',
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
