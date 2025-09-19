import 'package:flutter/material.dart';
import 'package:learning_app/features/category/models/category_model.dart';
import 'package:learning_app/features/category/views/widgets/category_section.dart';
import 'package:learning_app/features/entry/views/widgets/custom_search_bar.dart';
import 'package:learning_app/features/entry/views/widgets/home_app_bar.dart';
import 'package:learning_app/services/dummy_data_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Programming',
      icon: Icons.code,
      courseCount: DummyDataService.getCoursesByCategory('1').length,
    ),
    CategoryModel(
      id: '2',
      name: 'Design',
      icon: Icons.brush,
      courseCount: DummyDataService.getCoursesByCategory('2').length,
    ),
    CategoryModel(
      id: '3',
      name: 'Business',
      icon: Icons.business,
      courseCount: DummyDataService.getCoursesByCategory('3').length,
    ),
    CategoryModel(
      id: '4',
      name: 'Music',
      icon: Icons.music_note,
      courseCount: DummyDataService.getCoursesByCategory('4').length,
    ),
    CategoryModel(
      id: '5',
      name: 'Photography',
      icon: Icons.camera_alt,
      courseCount: DummyDataService.getCoursesByCategory('5').length,
    ),
    CategoryModel(
      id: '6',
      name: 'Language',
      icon: Icons.language,
      courseCount: DummyDataService.getCoursesByCategory('6').length,
    ),
    CategoryModel(
      id: '7',
      name: 'Health & Fitness',
      icon: Icons.fitness_center,
      courseCount: DummyDataService.getCoursesByCategory('7').length,
    ),
    CategoryModel(
      id: '8',
      name: 'Personal Development',
      icon: Icons.psychology,
      courseCount: DummyDataService.getCoursesByCategory('8').length,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const CustomSearchBar(),
              const SizedBox(height: 32),
              CategorySection(categories: categories),
            ]),
          ),
        ),
      ],
    );
  }
}
