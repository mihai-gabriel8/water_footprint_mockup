import '../result/question_result.dart';
import '../result/survey/survey_result.dart';
import '../steps/step.dart';

abstract class SurveyState {
  const SurveyState();
}

class LoadingSurveyState extends SurveyState {}

class PresentingSurveyState extends SurveyState {
  final List<Step> steps;
  final Set<QuestionResult> questionResults;
  final Step currentStep;
  final QuestionResult? result;
  final int currentStepIndex;
  final int stepCount;
  final bool isPreviousStep;

  PresentingSurveyState({
    required this.stepCount,
    required this.currentStep,
    required this.steps,
    required this.questionResults,
    this.result,
    this.currentStepIndex = 0,
    this.isPreviousStep = false,
  });
}

class SurveyResultState extends SurveyState {
  final SurveyResult result;
  final Step? currentStep;
  final QuestionResult? stepResult;

  SurveyResultState({
    required this.result,
    this.stepResult,
    required this.currentStep,
  });
}
