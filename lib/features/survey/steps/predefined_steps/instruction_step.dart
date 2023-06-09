import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../result/question_result.dart';
import '../../views/instruction_view.dart';
import '../identifier/step_identifier.dart';
import '../step.dart';

part 'instruction_step.g.dart';

@JsonSerializable(explicitToJson: true)
class InstructionStep extends Step {
  final String title;
  final String text;

  InstructionStep({
    required this.title,
    required this.text,
    bool isOptional = false,
    String buttonText = 'Next',
    StepIdentifier? stepIdentifier,
    bool? canGoBack,
    bool? showProgress,
    bool showAppBar = true,
  }) : super(
          stepIdentifier: stepIdentifier,
          isOptional: isOptional,
          buttonText: buttonText,
          canGoBack: canGoBack ?? false,
          showProgress: showProgress ?? false,
        );

  @override
  Widget createView({required QuestionResult? questionResult}) {
    return InstructionView(
      instructionStep: this,
    );
  }

  factory InstructionStep.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InstructionStepToJson(this);

  @override
  bool operator ==(other) =>
      super == (other) &&
      other is InstructionStep &&
      other.title == title &&
      other.text == text;
  @override
  int get hashCode => super.hashCode ^ title.hashCode ^ text.hashCode;
}
