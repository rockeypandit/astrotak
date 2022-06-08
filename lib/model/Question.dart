import 'package:json_annotation/json_annotation.dart';
part 'Question.g.dart';

@JsonSerializable()
class Question {
  final int? id;
  final String? name;
  final int? price;
  final String? description;
  final List<String>? suggestions;
  Question(
      {this.id, this.name, this.price, this.description, this.suggestions});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

// @JsonSerializable()
// class Questions {
//   final List<Question> questions;

//   Questions({required this.questions});

//   factory Questions.fromJson(Map<String, dynamic> json) =>
//       _$QuestionsFromJson(json);
//   Map<String, dynamic> toJson() => _$QuestionsToJson(this);
// }
