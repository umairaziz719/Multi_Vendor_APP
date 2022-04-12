import 'dart:convert';

class FAQModel {
  String? Question;
  String? Answer;
  FAQModel({
    this.Question,
    this.Answer,
  });

  FAQModel copyWith({
    String? Question,
    String? Answer,
  }) {
    return FAQModel(
      Question: Question ?? this.Question,
      Answer: Answer ?? this.Answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Question': Question,
      'Answer': Answer,
    };
  }

  factory FAQModel.fromMap(Map<String, dynamic> map) {
    return FAQModel(
      Question: map['Question'],
      Answer: map['Answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQModel.fromJson(String source) =>
      FAQModel.fromMap(json.decode(source));

  @override
  String toString() => 'FAQModel(Question: $Question, Answer: $Answer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FAQModel &&
        other.Question == Question &&
        other.Answer == Answer;
  }

  @override
  int get hashCode => Question.hashCode ^ Answer.hashCode;
}
