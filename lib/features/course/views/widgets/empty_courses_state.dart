import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';

class EmptyCoursesState extends StatelessWidget {
  const EmptyCoursesState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule_outlined,
            size: 64,
            color: AppColors.primary.withAlpha((0.5 * 255).round()),
          ),
          const SizedBox(height: 16),
          Text(
            "No Courses Yet",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primary.withAlpha((0.7 * 255).round()),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Create Your First Course"),
          ),
        ],
      ),
    );
  }
}
