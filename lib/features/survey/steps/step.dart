import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../result/question_result.dart';
import 'identifier/step_identifier.dart';
import 'predefined_steps/instruction_step.dart';
import 'predefined_steps/question_step.dart';
import 'step_not_defined_exception.dart';

abstract class Step {
  final StepIdentifier stepIdentifier;
  @JsonKey(defaultValue: false)
  final bool isOptional;
  @JsonKey(defaultValue: 'Next')
  final String? buttonText;
  final bool canGoBack;
  final bool showProgress;
  final bool isPercentage;

  Step({
    StepIdentifier? stepIdentifier,
    this.isOptional = false,
    this.buttonText = 'Next',
    this.canGoBack = true,
    this.showProgress = true,
    this.isPercentage = false,
    IconData? iconData,
  }) : stepIdentifier = stepIdentifier ?? StepIdentifier();

  Widget createView({required QuestionResult? questionResult});

  factory Step.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (type == 'intro') {
      return InstructionStep.fromJson(json);
    } else if (type == 'question') {
      return QuestionStep.fromJson(json);
      // } else if (type == 'completion') {
      //   return CompletionStep.fromJson(json);
    }
    throw StepNotDefinedException();
  }

  Map<String, dynamic> toJson();

  @override
  bool operator ==(other) =>
      other is Step &&
      other.stepIdentifier == stepIdentifier &&
      other.isOptional == isOptional &&
      other.buttonText == buttonText &&
      other.isPercentage == isPercentage;
  @override
  int get hashCode =>
      stepIdentifier.hashCode ^ isOptional.hashCode ^ buttonText.hashCode;
}
