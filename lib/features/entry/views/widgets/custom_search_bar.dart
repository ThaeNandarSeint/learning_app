import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha((0.08 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search courses...',
            hintStyle: TextStyle(
              color: AppColors.secondary.withAlpha((0.7 * 255).round()),
            ),
            prefixIcon: const Icon(Icons.search, color: AppColors.secondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.accent,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
