import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_footprint/features/score/repository/questions_repository.dart';
import 'package:water_footprint/features/survey/result/step_result.dart';
import 'package:water_footprint/features/survey/result/survey/survey_result.dart';
import 'package:water_footprint/features/survey/task/identifier/task_identifier.dart';
import 'package:water_footprint/features/survey/task/navigable_task.dart';

import '../../../common/config/questions_config.dart';
import '../../survey/task/task.dart';

part 'questionnaire_event.dart';
part 'questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  QuestionnaireBloc({
    required QuestionsRepository questionsRepository,
  })  : _questionsRepository = questionsRepository,
        super(const QuestionnaireState.initial()) {
    on<CategoryChangedEvent>(_onCategoryChanged);
    on<SurveyResultEvent>(_onSurveyResult);
  }

  final QuestionsRepository _questionsRepository;

  Future<void> _onCategoryChanged(
      CategoryChangedEvent event, Emitter<QuestionnaireState> emit) async {
    final task = await handleCategory(event.category);

    emit(QuestionnaireState.loadTasks(
        task: task,
        category: event.category,
        surveyStatus: state.surveyStatus));
  }

  Future<NavigableTask> handleCategory(QuestionsCategory category) async {
    switch (category) {
      case QuestionsCategory.Indoor:
        return _questionsRepository.indoorNavigableTask;
      case QuestionsCategory.Outdoor:
        return _questionsRepository.outdoorNavigableTask;
      case QuestionsCategory.Virtual:
        return _questionsRepository.virtualNavigableTask;
      case QuestionsCategory.initial:
        return _questionsRepository.initialNavigableTask;
    }
  }

  Future<void> _onSurveyResult(
      SurveyResultEvent event, Emitter<QuestionnaireState> emit) async {
    return emit(
      QuestionnaireState.initialFinished(status: event.surveyStatus),
    );
  }
}
