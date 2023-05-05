import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../score/bloc/score_bloc.dart';
import 'controller/survey_controller.dart';
import 'navigator/ordered_task_navigator.dart';
import 'navigator/task_navigator.dart';
import 'presenter/survey_presenter.dart';
import 'presenter/survey_state.dart';
import 'result/survey/survey_result.dart';
import 'task/navigable_task.dart';
import 'task/ordered_task.dart';
import 'task/task.dart';

class SurveyKit extends StatefulWidget {
  /// [Task] for the configuraton of the survey
  final Task task;

  /// [ThemeData] to override the Theme of the subtree
  final ThemeData? themeData;

  /// Function which is called after the results are collected
  final Function(SurveyResult) onResult;

  /// [SurveyController] to override the navigation methods
  /// onNextStep, onBackStep, onCloseSurvey
  final SurveyController? surveyController;

  /// If the progressbar shoud be show in the appbar
  final bool? showProgress;

  // Changes the styling of the progressbar in the appbar
  // final SurveyProgressConfiguration? surveyProgressbarConfiguration;

  final Map<String, String>? localizations;

  const SurveyKit({
    super.key,
    required this.task,
    required this.onResult,
    this.themeData,
    this.surveyController,
    this.showProgress,
    // this.surveyProgressbarConfiguration,
    this.localizations,
  });

  @override
  _SurveyKitState createState() => _SurveyKitState();
}

class _SurveyKitState extends State<SurveyKit> {
  late TaskNavigator _taskNavigator;

  @override
  void initState() {
    super.initState();
    _taskNavigator = _createTaskNavigator();
  }

  TaskNavigator _createTaskNavigator() {
    switch (widget.task.runtimeType) {
      case OrderedTask:
        return OrderedTaskNavigator(widget.task);
      case NavigableTask:
      // return NavigableTaskNavigator(widget.task);
      default:
        return OrderedTaskNavigator(widget.task);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: widget.themeData ?? Theme.of(context),
      child: MultiProvider(
        providers: [
          Provider<TaskNavigator>.value(value: _taskNavigator),
          Provider<SurveyController>.value(
              value: widget.surveyController ?? SurveyController()),
          Provider<bool>.value(value: widget.showProgress ?? true),
          // Provider<SurveyProgressConfiguration>.value(
          //   value: widget.surveyProgressbarConfiguration ??
          //       SurveyProgressConfiguration(),
          // ),
          Provider<Map<String, String>?>.value(value: widget.localizations)
        ],
        child: BlocProvider(
          create: (BuildContext context) => SurveyPresenter(
            scoreBloc: BlocProvider.of<ScoreBloc>(context),
            taskNavigator: _taskNavigator,
            onResult: widget.onResult,
          ),
          child: SurveyPage(
            length: widget.task.steps.length,
            onResult: widget.onResult,
          ),
        ),
      ),
    );
  }
}

class SurveyPage extends StatefulWidget {
  final int length;
  final Function(SurveyResult) onResult;

  const SurveyPage({
    super.key,
    required this.length,
    required this.onResult,
  });

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: widget.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyPresenter, SurveyState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        if (state is SurveyResultState) {
          widget.onResult.call(state.result);
        }
        if (state is PresentingSurveyState) {
          tabController.animateTo(state.currentStepIndex);
        }
      },
      builder: (BuildContext context, SurveyState state) {
        if (state is PresentingSurveyState) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: state.steps
                .map(
                  (e) => _SurveyView(
                    id: e.stepIdentifier.id,
                    createView: () => e.createView(
                      questionResult: state.questionResults.firstWhereOrNull(
                        (element) => element.id == e.stepIdentifier,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else if (state is SurveyResultState && state.currentStep != null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _SurveyView extends StatelessWidget {
  const _SurveyView({required this.id, required this.createView});

  final String id;
  final Widget Function() createView;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey<String>(
        id,
      ),
      child: createView(),
    );
  }
}
