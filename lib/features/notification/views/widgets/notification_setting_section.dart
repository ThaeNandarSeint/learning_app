import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/notification/views/widgets/notification_setting_tile.dart';

class NotificationSettingSection extends StatelessWidget {
  const NotificationSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha((0.1 * 255).round()),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          NotificationSettingTile(
            title: "Push Notifications",
            description: 'Receive push notifications',
            icon: Icons.notifications_outlined,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
          _buildDivider(),
          NotificationSettingTile(
            title: "Course Updates",
            description: 'Get notified about course updates',
            icon: Icons.school_outlined,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
          _buildDivider(),
          NotificationSettingTile(
            title: "Quiz Reminders",
            description: 'Receiver quiz deadline reminders',
            icon: Icons.quiz_outlined,
            trailing: Switch(
              value: false,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDivider() {
  return Divider(
    color: AppColors.primary.withAlpha((0.1 * 255).round()),
    height: 1,
  );
}
