import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/entry/models/onboarding_item_model.dart';
import 'package:learning_app/features/entry/views/widgets/onboarding_item.dart';
import 'package:learning_app/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    int _currentPage = 0;

    final List<OnboardingItemModel> _pages = [
      OnboardingItemModel(
        image: 'assets/images/onboarding/onboarding1.png',
        title: 'Learn Anywhere',
        description:
            'Access your courses anytime, anywhere. Learn at your own pace with our flexible learning platform.',
      ),
      OnboardingItemModel(
        image: 'assets/images/onboarding/onboarding2.png',
        title: 'Interactive Learning',
        description:
            'Enage with interactive quizzes, live sessions and hands-on projects to enhance your learning experience.',
      ),
      OnboardingItemModel(
        image: 'assets/images/onboarding/onboarding3.png',
        title: 'Track Progress',
        description:
            'Monitor your progress, earn certificates and achieve your learning goals with detailed analytics.',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) =>
                OnboardingItem(item: _pages[index]),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Get.offAllNamed(AppRoutes.login),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: const WormEffect(
                    dotColor: Colors.white54,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      Get.offAllNamed(AppRoutes.login);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
