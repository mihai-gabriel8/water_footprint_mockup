import 'package:json_annotation/json_annotation.dart';

import '../../answer_format/text_choice.dart';
import '../../steps/identifier/identifier.dart';
import '../question_result.dart';

part 'multiple_choice_question_result.g.dart';

@JsonSerializable(explicitToJson: true)
class MultipleChoiceQuestionResult extends QuestionResult<List<TextChoice>?> {
  MultipleChoiceQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String valueIdentifier,
    required List<TextChoice>? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory MultipleChoiceQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleChoiceQuestionResultToJson(this);

  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}
