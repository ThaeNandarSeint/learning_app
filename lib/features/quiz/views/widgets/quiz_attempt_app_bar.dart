import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';

class QuizAttemptAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuizAttemptAppBar({
    super.key,
    required this.formattedTime,
    required this.onSubmit,
  });

  final String formattedTime;
  final VoidCallback onSubmit;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.accent),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.accent.withAlpha((0.1 * 255).round()),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.timer_outlined, color: AppColors.accent, size: 20),
            const SizedBox(width: 8),
            Text(
              formattedTime,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: TextButton(
            onPressed: onSubmit,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.accent.withAlpha((0.1 * 255).round()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Submit',
              style: theme.textTheme.labelLarge?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
