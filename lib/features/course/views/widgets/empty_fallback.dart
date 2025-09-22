import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';

class EmptyFallback extends StatelessWidget {
  const EmptyFallback({
    super.key,
    this.title = 'No Courses Found',
    this.message = 'There are no courses available in this category yet.',
    this.onActionPressed,
    this.actionLabel = 'Go Back',
    this.icon = Icons.school_outlined,
  });

  final String title;
  final String message;
  final VoidCallback? onActionPressed;
  final String actionLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppColors.primary.withAlpha((0.5 * 255).round()),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onActionPressed ?? () => Get.back(),
            label: Text(actionLabel),
            icon: const Icon(Icons.arrow_back),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
