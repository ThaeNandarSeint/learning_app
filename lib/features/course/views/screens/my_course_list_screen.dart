import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/course/views/widgets/empty_courses_state.dart';
import 'package:learning_app/features/course/views/widgets/my_courses_app_bar.dart';
import 'package:learning_app/features/course/views/widgets/teacher_course_card.dart';
import 'package:learning_app/services/dummy_data_service.dart';

class MyCourseListScreen extends StatelessWidget {
  const MyCourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherCourses = DummyDataService.getInstructorCourses('inst_1');

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const MyCoursesAppBar(),
          if (teacherCourses.isEmpty)
            const SliverFillRemaining(child: EmptyCoursesState())
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      TeacherCourseCard(course: teacherCourses[index]),
                  childCount: teacherCourses.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
