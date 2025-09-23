import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/features/quiz/models/quiz_attempt_model.dart';
import 'package:learning_app/features/quiz/models/quiz_model.dart';
import 'package:learning_app/features/quiz/views/screens/quiz_result_screen.dart';

class QuizSubmitDialog extends StatelessWidget {
  const QuizSubmitDialog({
    super.key,
    required this.attempt,
    required this.quiz,
  });

  final QuizAttemptModel attempt;
  final QuizModel quiz;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Submit Quiz'),
      content: const Text('Are you sure you want to submit your answers?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            Get.off(() => QuizResultScreen(attempt: attempt, quiz: quiz));
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
