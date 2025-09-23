import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/course/models/course_model.dart';

class CertificateDialog extends StatelessWidget {
  const CertificateDialog({
    super.key,
    required this.course,
    required this.onDownload,
  });

  final CourseModel course;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Congratulations! '),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.workspace_premium,
            size: 64,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'You have completed all lessons in "${course.title}"',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'You can now download your certificate of completion',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.secondary),
          ),
        ],
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Later',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  onDownload();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  backgroundColor: AppColors.primary,
                ),
                child: Text(
                  'Later',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
