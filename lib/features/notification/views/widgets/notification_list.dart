import 'package:flutter/material.dart';
import 'package:learning_app/features/notification/views/widgets/notification_card.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return NotificationCard(
          title: 'New Course Available',
          message: 'Check out our new Flutter Advanced course!',
          time: '2 hours ago',
          icon: Icons.school,
          isUnread: index == 0,
        );
      },
    );
  }
}
