import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CourseDetailAppBar extends StatelessWidget {
  const CourseDetailAppBar({
    super.key,
    required this.imageUrl,
    this.expandedHeight = 250,
  });

  final String imageUrl;
  final double expandedHeight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.accent.withAlpha((0.8 * 255).round()),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.primary.withAlpha((0.1 * 255).round()),
                highlightColor: AppColors.accent,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.primary.withAlpha((0.1 * 255).round()),
                child: const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
