import 'package:flutter/material.dart';
import 'package:learning_app/features/quiz/models/quiz_attempt_model.dart';
import 'package:learning_app/features/quiz/models/quiz_model.dart';

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
    return const Placeholder();
  }
}
