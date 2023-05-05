import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../answer_format/answer_format.dart';
import '../../answer_format/multiple_choice_answer_format.dart';
import '../../answer_format/scale_answer_format.dart';
import '../../answer_format/single_choice_answer_format.dart';
import '../../result/question/multiple_choice_question_result.dart';
import '../../result/question/scale_question_result.dart';
import '../../result/question/single_choice_question_result.dart';
import '../../result/question_result.dart';
import '../../views/multiple_choice_answer_view.dart';
import '../../views/scale_answer_view.dart';
import '../../views/single_choice_answer_view.dart';
import '../identifier/step_identifier.dart';
import '../step.dart';
import 'answer_format_not_defined_exception.dart';

part 'question_step.g.dart';

@JsonSerializable()
class QuestionStep extends Step {
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String text;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final Widget content;
  final AnswerFormat answerFormat;

  final IconData iconData1;

  QuestionStep({
    bool isOptional = false,
    String buttonText = 'Next',
    StepIdentifier? stepIdentifier,
    bool showAppBar = true,
    bool isPercentage = false,
    required this.iconData1,
    this.title = '',
    this.text = '',
    this.content = const SizedBox.shrink(),
    required this.answerFormat,
  }) : super(
          stepIdentifier: stepIdentifier,
          isOptional: isOptional,
          buttonText: buttonText,
        );

  @override
  Widget createView({required QuestionResult? questionResult}) {
    final key = ObjectKey(stepIdentifier.id);

    switch (answerFormat.runtimeType) {
      case SingleChoiceAnswerFormat:
        FocusManager.instance.primaryFocus?.unfocus();
        return SingleChoiceAnswerView(
          key: key,
          questionStep: this,
          result: questionResult as SingleChoiceQuestionResult?,
        );
      case MultipleChoiceAnswerFormat:
        return MultipleChoiceAnswerView(
          key: key,
          questionStep: this,
          result: questionResult as MultipleChoiceQuestionResult?,
        );
      case ScaleAnswerFormat:
        return ScaleAnswerView(
          isPercentage: isPercentage,
          key: key,
          questionStep: this,
          result: questionResult as ScaleQuestionResult?,
        );
      default:
        throw AnswerFormatNotDefinedException();
    }
  }

  factory QuestionStep.fromJson(Map<String, dynamic> json) =>
      _$QuestionStepFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionStepToJson(this);
}
