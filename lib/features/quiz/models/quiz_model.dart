import 'package:learning_app/features/quiz/models/question_model.dart';

class QuizModel {
  final String id;
  final String title;
  final String description;
  final int timeLimit;
  final List<QuestionModel> questions;
  final DateTime createdAt;
  final bool isActive;

  QuizModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timeLimit,
    required this.questions,
    required this.createdAt,
    this.isActive = true,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      timeLimit: json['timeLimit'] ?? 30,
      questions: (json['questions'] as List<dynamic>)
          .map((q) => QuestionModel.fromMap(q))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'timeLimit': timeLimit,
      'questions': questions.map((q) => q.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }
}
