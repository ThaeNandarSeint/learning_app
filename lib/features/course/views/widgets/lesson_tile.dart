import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({
    super.key,
    required this.title,
    required this.duration,
    required this.isCompleted,
    required this.isLocked,
    required this.isUnlocked,
    required this.onTap,
  });

  final String title;
  final String duration;
  final bool isCompleted;
  final bool isLocked;
  final bool isUnlocked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: isCompleted
            ? theme.colorScheme.primary
            : isLocked
            ? theme.colorScheme.secondary.withAlpha((0.1 * 255).round())
            : theme.colorScheme.secondary.withAlpha((0.2 * 255).round()),
        child: Icon(
          isCompleted
              ? Icons.check
              : isLocked
              ? Icons.lock
              : Icons.play_arrow,
          color: isCompleted
              ? theme.colorScheme.onPrimary
              : isLocked
              ? theme.colorScheme.secondary
              : theme.colorScheme.secondary,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isLocked ? theme.colorScheme.secondary : null,
        ),
      ),
      subtitle: Text(
        duration,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isLocked ? theme.colorScheme.secondary : null,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
