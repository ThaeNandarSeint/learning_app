class QuestionModel {
  final String id;
  final String text;
  final String correctOptionId;
  final int points;
  final List<OptionModel> options;

  QuestionModel({
    required this.id,
    required this.text,
    required this.correctOptionId,
    this.points = 1,
    required this.options,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      correctOptionId: map['correctOptionId'] ?? '',
      points: map['points'] ?? '',
      options: (map['correctOptionId'] as List<dynamic>)
          .map((o) => OptionModel.fromMap(o))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'correctOptionId': correctOptionId,
      'points': points,
      'options': options.map((o) => o.toMap()).toList(),
    };
  }
}

class OptionModel {
  final String id;
  final String text;

  OptionModel({required this.id, required this.text});

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(id: map['id'] ?? '', text: map['text'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'text': text};
  }
}
