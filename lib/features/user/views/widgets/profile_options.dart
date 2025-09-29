import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/core/utils/app_dialogs.dart';
import 'package:learning_app/features/user/views/widgets/profile_option_card.dart';
import 'package:learning_app/routes/app_routes.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionCard(
          title: 'Edit Profile',
          description: 'Update your personal information',
          icon: Icons.edit_outlined,
          onTap: () => Get.toNamed(AppRoutes.editProfile),
        ),
        ProfileOptionCard(
          title: 'Notifications',
          description: 'Manage your notifications',
          icon: Icons.notifications_outlined,
          onTap: () => Get.toNamed(AppRoutes.notifications),
        ),
        ProfileOptionCard(
          title: 'Settings',
          description: 'App preferences and more',
          icon: Icons.settings_outlined,
          onTap: () => Get.toNamed(AppRoutes.settings),
        ),
        ProfileOptionCard(
          title: 'Help & Support',
          description: 'Get help or contact support',
          icon: Icons.help_outline,
          onTap: () {},
        ),
        ProfileOptionCard(
          title: 'Logout',
          description: 'Sign out of your account',
          icon: Icons.logout,
          onTap: () async {
            final confirm = await AppDialogs.showLogoutDialog();
            if (confirm == true) {
              Get.offAllNamed(AppRoutes.login);
            }
          },
          isDestructive: true,
        ),
      ],
    );
  }
}
