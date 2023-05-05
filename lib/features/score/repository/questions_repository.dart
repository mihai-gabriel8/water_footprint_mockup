import 'dart:developer';

import 'package:water_footprint/common/config/questions_config.dart';
import 'package:water_footprint/features/survey/task/identifier/task_identifier.dart';
import 'package:water_footprint/features/survey/task/task.dart';
import 'package:water_footprint/features/water_footprint/blocs/questionnaire_bloc.dart';

import '../../survey/answer_format/multiple_choice_answer_format.dart';
import '../../survey/answer_format/single_choice_answer_format.dart';
import '../../survey/answer_format/text_choice.dart';
import '../../survey/steps/predefined_steps/question_step.dart';
import '../../survey/steps/step.dart';
import '../../survey/task/navigable_task.dart';

const _delay = Duration(milliseconds: 300);
Future<void> wait() => Future.delayed(_delay);

class QuestionsRepository {
  final NavigableTask indoorNavigableTask;
  final NavigableTask outdoorNavigableTask;
  final NavigableTask virtualNavigableTask;
  final NavigableTask initialNavigableTask;

  QuestionsRepository({
    required this.indoorNavigableTask,
    required this.outdoorNavigableTask,
    required this.virtualNavigableTask,
    required this.initialNavigableTask,
  });

  // Future<Task> fetchTask({required QuestionsCategory questionsCategory}) async {
  //   // await wait();
  //   switch (questionsCategory) {
  //     case QuestionsCategory.Indoor:
  //       final steps = await fetchQuestion(questionsCategory: questionsCategory);

  //       return NavigableTask(
  //         steps: steps!,
  //       );
  //     case QuestionsCategory.Outdoor:
  //       final steps = await fetchQuestion(questionsCategory: questionsCategory);

  //       return NavigableTask(
  //         steps: steps!,
  //       );
  //     case QuestionsCategory.Virtual:
  //       final steps = await fetchQuestion(questionsCategory: questionsCategory);

  //       return NavigableTask(
  //         steps: steps!,
  //       );
  //   }
  // }

  // Future<List<Step>?> fetchQuestion(
  //     {required QuestionsCategory questionsCategory}) async {
  //   switch (questionsCategory) {
  //     case QuestionsCategory.Indoor:
  //       return QuestionsConfig.indoorSteps;
  //     case QuestionsCategory.Outdoor:
  //       return QuestionsConfig.outdoorSteps;
  //     case QuestionsCategory.Virtual:
  //       return QuestionsConfig.virtualSteps;
  //     default:
  //       return [];
  //   }
  // }
}
