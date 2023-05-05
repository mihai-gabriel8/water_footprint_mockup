import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/score_bloc.dart';

class ScoreTracker extends StatelessWidget {
  const ScoreTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoreBloc, ScoreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ScoreLoading) {
          return const SizedBox(
            height: 30,
          );
        }
        if (state is ScoreLoaded) {
          return Text(
            '${(state.score.score * 3.785).floor()}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          );
        }
        return const Text(
          'No data for now:(',
          style: TextStyle(fontSize: 10),
        );
      },
    );
  }
}
