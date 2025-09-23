import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/quiz/models/question_model.dart';
import 'package:learning_app/features/quiz/models/quiz_attempt_model.dart';
import 'package:learning_app/features/quiz/models/quiz_model.dart';

class QuizQuestionAnalysis extends StatelessWidget {
  const QuizQuestionAnalysis({
    super.key,
    required this.quiz,
    required this.attempt,
  });

  final QuizModel quiz;
  final QuizAttemptModel attempt;

  Widget _buildQuestionResult(
    ThemeData theme,
    QuestionModel question,
    bool isCorrect,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withAlpha((0.1 * 255).round())
            : Colors.red.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              question.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question Analysis',
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...quiz.questions.map((question) {
            final userAnswer = attempt.answers[question.id];
            final isCorrect = userAnswer == question.correctOptionId;
            return _buildQuestionResult(theme, question, isCorrect);
          }),
        ],
      ),
    );
  }
}
