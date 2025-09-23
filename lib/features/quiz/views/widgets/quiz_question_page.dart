import 'package:flutter/material.dart';
import 'package:learning_app/core/theme/app_colors.dart';
import 'package:learning_app/features/quiz/models/question_model.dart';
import 'package:learning_app/features/quiz/views/widgets/quiz_option_tile.dart';

class QuizQuestionPage extends StatelessWidget {
  const QuizQuestionPage({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.question,
    this.selectedOptionId,
    required this.onOptionSelected,
  });

  final int questionNumber;
  final int totalQuestions;
  final QuestionModel question;
  final String? selectedOptionId;
  final Function(String) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha((0.1 * 255).round()),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Question $questionNumber of $totalQuestions',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            question.text,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          ...question.options.map(
            (option) => QuizOptionTile(
              optionId: option.id,
              text: option.text,
              isSelected: selectedOptionId == option.id,
              onTap: () => onOptionSelected(option.id),
              selectedOptionId: selectedOptionId,
            ),
          ),
        ],
      ),
    );
  }
}
