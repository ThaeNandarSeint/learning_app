import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/entry/models/onboarding_item_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.item});

  final OnboardingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.4,
              padding: const EdgeInsets.all(32),
              child: Image.asset(item.image, fit: BoxFit.contain),
            ),
            const SizedBox(height: 40),
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                item.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
