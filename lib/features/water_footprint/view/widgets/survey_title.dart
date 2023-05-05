import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/questionnaire_bloc.dart';

class SurveyTitle extends StatelessWidget {
  const SurveyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.category) {
          case QuestionsCategory.Indoor:
            return const Text('INDOOR WATER');

          case QuestionsCategory.Outdoor:
            return const Text('OUTDOOR WATER');

          case QuestionsCategory.Virtual:
            return const Text('VIRTUAL WATER');

          case QuestionsCategory.initial:
            return const Text('START');
        }
      },
    );
  }
}
