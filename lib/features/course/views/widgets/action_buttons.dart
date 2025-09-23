import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/features/course/models/course_model.dart';
import 'package:learning_app/routes/app_routes.dart';
import 'package:learning_app/services/dummy_data_service.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (course.isPremium &&
                  !DummyDataService.isCourseUnlocked(course.id)) {
                Get.toNamed(
                  AppRoutes.payment,
                  arguments: {
                    'courseId': course.id,
                    'courseName': course.title,
                    'price': course.price,
                  },
                );
              } else {
                Get.toNamed(
                  AppRoutes.lessonDetail.replaceAll(
                    ':id',
                    course.lessons.first.id,
                  ),
                  parameters: {'courseId': course.id},
                );
              }
            },
            label: const Text('Start Learning'),
            icon: const Icon(Icons.play_circle),
          ),
        ),
        if (!course.isPremium ||
            DummyDataService.isCourseUnlocked(course.id)) ...[
          const SizedBox(width: 16),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
        ],
      ],
    );
  }
}
