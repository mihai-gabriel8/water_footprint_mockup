import 'package:json_annotation/json_annotation.dart';
import 'package:water_footprint/features/survey/result/question/multiple_choice_question_result.dart';

import '../steps/identifier/identifier.dart';
import 'question/scale_question_result.dart';
import 'question/single_choice_question_result.dart';
import 'question_result.dart';
import 'result.dart';

part 'step_result.g.dart';

@JsonSerializable(explicitToJson: true)
class StepResult extends Result {
  @_Converter()
  final List<QuestionResult> results;

  const StepResult(
      {required Identifier? id,
      required DateTime startDate,
      required DateTime endDate,
      required this.results})
      : super(id: id, startDate: startDate, endDate: endDate);

  factory StepResult.fromQuestion({required QuestionResult questionResult}) {
    return StepResult(
      id: questionResult.id,
      startDate: questionResult.startDate,
      endDate: questionResult.endDate,
      results: [questionResult],
    );
  }

  factory StepResult.fromJson(Map<String, dynamic> json) =>
      _$StepResultFromJson(json);

  Map<String, dynamic> toJson() => _$StepResultToJson(this);

  @override
  List<Object?> get props => [id, startDate, endDate];
}

class _Converter implements JsonConverter<List<QuestionResult>, Object> {
  const _Converter();

  @override
  Object toJson(List<QuestionResult> questionResults) {
    List<Map<String, dynamic>> allQuestionResultsEncoded = [];

    for (QuestionResult qr in questionResults) {
      if (qr is MultipleChoiceQuestionResult) {
        final qrJson = qr.toJson();
        qrJson['type'] = (MultipleChoiceQuestionResult).toString();
        allQuestionResultsEncoded.add(qrJson);
      } else if (qr is ScaleQuestionResult) {
        final qrJson = qr.toJson();
        qrJson['type'] = (ScaleQuestionResult).toString();
        allQuestionResultsEncoded.add(qrJson);
      } else if (qr is SingleChoiceQuestionResult) {
        final qrJson = qr.toJson();
        qrJson['type'] = (SingleChoiceQuestionResult).toString();
        allQuestionResultsEncoded.add(qrJson);
      } else {
        throw ('Unhandled Question Result Type');
      }
    }

    return allQuestionResultsEncoded;
  }

  @override
  List<QuestionResult> fromJson(Object json) {
    final List<QuestionResult> results = [];
    for (var element in json as List<dynamic>) {
      final qData = element as Map<String, dynamic>;
      final qType = qData['type'] as String;

      if (qType == (MultipleChoiceQuestionResult).toString()) {
        results.add(MultipleChoiceQuestionResult.fromJson(qData));
      } else if (qType == (ScaleQuestionResult).toString()) {
        results.add(ScaleQuestionResult.fromJson(qData));
      } else if (qType == (SingleChoiceQuestionResult).toString()) {
        results.add(SingleChoiceQuestionResult.fromJson(qData));
      } else {
        throw ('Unhandled Question Result Type');
      }
    }

    return results;
  }
}
