import '../steps/predefined_steps/answer_format_not_defined_exception.dart';
import 'multiple_choice_answer_format.dart';
import 'scale_answer_format.dart';
import 'single_choice_answer_format.dart';

abstract class AnswerFormat {
  const AnswerFormat();

  factory AnswerFormat.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'single':
        return SingleChoiceAnswerFormat.fromJson(json);
      case 'multiple':
        return MultipleChoiceAnswerFormat.fromJson(json);
      case 'scale':
        return ScaleAnswerFormat.fromJson(json);
      default:
        throw const AnswerFormatNotDefinedException();
    }
  }
  Map<String, dynamic> toJson();
}
