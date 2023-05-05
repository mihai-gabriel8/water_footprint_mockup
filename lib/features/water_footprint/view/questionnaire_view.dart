import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_footprint/features/survey/survey_kit.dart';
import 'package:water_footprint/features/water_footprint/blocs/questionnaire_bloc.dart';

import '../../../common/config/questions_config.dart';
import '../../score/repository/questions_repository.dart';
import '../../survey/task/identifier/task_identifier.dart';
import '../../survey/task/navigable_task.dart';

class QuestionnaireView extends StatefulWidget {
  const QuestionnaireView({super.key});

  @override
  State<QuestionnaireView> createState() => _QuestionnaireViewState();
}

class _QuestionnaireViewState extends State<QuestionnaireView> {
  // void changeCategory() {
  //   setState(() {
  //     context
  //         .read<QuestionnaireBloc>()
  //         .add(CategoryChangedEvent(category: QuestionsCategory.Indoor));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final task = context.select((QuestionnaireBloc bloc) => bloc.state.task) ??
        NavigableTask(
          id: TaskIdentifier(),
          steps: QuestionsConfig.initialStep,
        );

    return BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.category) {
          case QuestionsCategory.Indoor:
            return SurveyKit(
              key: const Key('indoor'),
              task: task,
              onResult: (result) {
                context.read<QuestionnaireBloc>().add(SurveyResultEvent(
                    nextCategory: QuestionsCategory.Outdoor,
                    surveyStatus: SurveyStatus.indoorFinished));
                context.read<QuestionnaireBloc>().add(
                    CategoryChangedEvent(category: QuestionsCategory.Outdoor));
              },
            );
          case QuestionsCategory.Outdoor:
            inspect(task.navigationRules);
            return SurveyKit(
              key: const Key('outdoor'),
              task: task,
              onResult: (result) {
                context.read<QuestionnaireBloc>().add(SurveyResultEvent(
                    nextCategory: QuestionsCategory.Virtual,
                    surveyStatus: SurveyStatus.outdoorFinished));
                context.read<QuestionnaireBloc>().add(
                    CategoryChangedEvent(category: QuestionsCategory.Virtual));
              },
            );
          case QuestionsCategory.Virtual:
            return SurveyKit(
              key: const Key('virtual'),
              task: task,
              onResult: (result) {
                context.read<QuestionnaireBloc>().add(SurveyResultEvent(
                    nextCategory: QuestionsCategory.Indoor,
                    surveyStatus: SurveyStatus.virtualFinished));
                context.read<QuestionnaireBloc>().add(
                    CategoryChangedEvent(category: QuestionsCategory.Indoor));
              },
            );
          case QuestionsCategory.initial:
            return SurveyKit(
              key: const Key('initial'),
              task: task,
              onResult: (result) {
                context.read<QuestionnaireBloc>().add(SurveyResultEvent(
                    nextCategory: QuestionsCategory.Indoor,
                    surveyStatus: SurveyStatus.initialFinished));
                context.read<QuestionnaireBloc>().add(
                    CategoryChangedEvent(category: QuestionsCategory.Indoor));
              },
            );
        }
      },
    );
  }
}
