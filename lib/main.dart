import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_footprint/features/auth/signin_view.dart';
import 'package:water_footprint/features/score/repository/questions_repository.dart';
import 'package:water_footprint/features/survey/task/identifier/task_identifier.dart';
import 'package:water_footprint/features/water_footprint/blocs/questionnaire_bloc.dart';

import 'app/app_theme.dart';
import 'common/config/questions_config.dart';
import 'features/score/score.dart';
import 'features/survey/navigator/rules/conditional_navigation_rule.dart';
import 'features/survey/task/navigable_task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TaskIdentifier taskIdentifier1;
  late final TaskIdentifier taskIdentifier2;
  late final TaskIdentifier taskIdentifier3;

  late final NavigableTask _indoorNavigableTask;
  late final NavigableTask _outdoorNavigableTask;
  late final NavigableTask _virtualNavigableTask;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getIds();
      await getNavigableTasks();
      // await getNavigationRules();

      setState(() {});
    });
  }

  Future<void> getIds() async {
    setState(() {
      taskIdentifier1 = TaskIdentifier(id: '1');
      taskIdentifier2 = TaskIdentifier(id: '2');
      taskIdentifier3 = TaskIdentifier(id: '3');
    });
  }

  Future<void> getNavigableTasks() async {
    setState(() {
      _indoorNavigableTask = NavigableTask(
        id: taskIdentifier1,
        steps: QuestionsConfig.indoorSteps,
      );
      _outdoorNavigableTask = NavigableTask(
        id: taskIdentifier2,
        steps: QuestionsConfig.outdoorSteps,
      );
      _outdoorNavigableTask.addNavigationRule(
        forTriggerStepIdentifier: _outdoorNavigableTask.steps[0].stepIdentifier,
        navigationRule: ConditionalNavigationRule(
          resultToStepIdentifierMapper: (input) {
            switch (input) {
              case "yes":
                return _outdoorNavigableTask.steps[1].stepIdentifier;
              case "no":
                return _outdoorNavigableTask.steps[2].stepIdentifier;
              default:
                return null;
            }
          },
        ),
      );
      inspect(_outdoorNavigableTask.navigationRules);
      _virtualNavigableTask = NavigableTask(
        id: taskIdentifier3,
        steps: QuestionsConfig.virtualSteps,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        _configureScoreRepository(),
        _configureQuestionsRepository(),
      ],
      child: MultiBlocProvider(
        providers: [
          _configureScoreBloc(),
          _configureQuestionnaireBloc(),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.themeData[AppThemeMode.lightTheme],
          home: const SignInView(),
        ),
      ),
    );
  }

  RepositoryProvider<QuestionsRepository> _configureQuestionsRepository() {
    return RepositoryProvider<QuestionsRepository>(
      create: (context) => QuestionsRepository(
        indoorNavigableTask: _indoorNavigableTask,
        outdoorNavigableTask: _outdoorNavigableTask,
        virtualNavigableTask: _virtualNavigableTask,
        initialNavigableTask: NavigableTask(
          id: TaskIdentifier(),
          steps: QuestionsConfig.initialStep,
        ),
      ),
      lazy: true,
    );
  }

  RepositoryProvider<ScoreRepository> _configureScoreRepository() {
    return RepositoryProvider<ScoreRepository>(
      create: (context) => ScoreRepository(),
      lazy: true,
    );
  }

  BlocProvider<ScoreBloc> _configureScoreBloc() {
    return BlocProvider<ScoreBloc>(
      create: (context) => ScoreBloc(
        scoreRepository: RepositoryProvider.of<ScoreRepository>(context),
      )..add(ScoreStarted()),
    );
  }

  BlocProvider<QuestionnaireBloc> _configureQuestionnaireBloc() {
    return BlocProvider<QuestionnaireBloc>(
      create: (context) => QuestionnaireBloc(
          questionsRepository:
              RepositoryProvider.of<QuestionsRepository>(context)),
    );
  }
}
