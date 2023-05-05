part of 'questionnaire_bloc.dart';

abstract class QuestionnaireEvent {}

class CategoryChangedEvent extends QuestionnaireEvent {
  final QuestionsCategory category;

  CategoryChangedEvent({required this.category});
}

class ProgressChangedEvent extends QuestionnaireEvent {
  final QuestionsCategory category;
  final int progress;

  ProgressChangedEvent({required this.category, required this.progress});
}

class SurveyResultEvent extends QuestionnaireEvent {
  final QuestionsCategory nextCategory;
  final SurveyStatus surveyStatus;

  SurveyResultEvent({required this.nextCategory, required this.surveyStatus});
}
