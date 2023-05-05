part of 'questionnaire_bloc.dart';

enum QuestionsCategory {
  initial,
  Indoor,
  Outdoor,
  Virtual,
}

enum SurveyStatus {
  empty,
  initialFinished,
  indoorFinished,
  outdoorFinished,
  virtualFinished,
}

class QuestionnaireState extends Equatable {
  final Map<QuestionsCategory, int>? progress;

  // final SurveyResult result;
  final NavigableTask? task;
  const QuestionnaireState._({
    this.progress,
    this.category = QuestionsCategory.initial,
    this.task,
    this.surveyStatus = SurveyStatus.empty,
  });

  const QuestionnaireState.initial() : this._();

  final QuestionsCategory category;

  final SurveyStatus surveyStatus;

  QuestionnaireState.loadTasks(
      {required NavigableTask? task,
      required QuestionsCategory category,
      required SurveyStatus surveyStatus})
      : this._(
          progress: {
            QuestionsCategory.Indoor: 0,
            QuestionsCategory.Outdoor: 0,
            QuestionsCategory.Virtual: 0,
          },
          task: task,
          category: category,
          surveyStatus: surveyStatus,
        );
  const QuestionnaireState.initialFinished({required SurveyStatus status})
      : this._(surveyStatus: status);

  QuestionnaireState copyWith({
    Map<QuestionsCategory, int>? progress,
    QuestionsCategory? category,
    required SurveyStatus surveyStatus,
    required NavigableTask? task,
  }) {
    return QuestionnaireState._(
      progress: progress ?? this.progress,
      category: category ?? this.category,
      task: task ?? this.task,
      // result: result ?? this.result,
    );
  }

  bool get isComplete => task != null && progress != null;

  @override
  List<Object?> get props => [
        progress,
        category,
        task,
      ];
}
