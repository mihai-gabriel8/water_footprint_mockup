import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/models.dart';
import '../repository/repository.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc({required this.scoreRepository}) : super(ScoreLoading()) {
    on<ScoreStarted>(_onStarted);
    on<ScoreChanged>(_onScoreChanged);
    _scoreSubscription =
        scoreRepository.score.listen((score) => add(ScoreChanged(score)));
  }
  late StreamSubscription<Score> _scoreSubscription;
  final ScoreRepository scoreRepository;
  num scoreDummy = 0;
  Future<void> _onStarted(ScoreStarted event, Emitter<ScoreState> emit) async {
    emit(ScoreLoading());
    try {
      final score = await scoreRepository.loadScore();
      emit(ScoreLoaded(score: score));
    } catch (_) {
      emit(ScoreError());
    }
  }

  Future<void> _onScoreChanged(
      ScoreChanged event, Emitter<ScoreState> emit) async {
    final state = this.state;
    print(scoreDummy);
    scoreDummy = scoreDummy + event.score.score;
    emit(ScoreLoading());
    return emit(ScoreLoaded(score: Score(score: (scoreDummy).floor())));
    // if (state is ScoreLoaded) {
    //   try {
    //     // scoreRepository.changeScore(event.score);
    //     emit(ScoreLoaded(score: event.score));
    //   } catch (_) {
    //     emit(ScoreError());
    //   }
    // }
  }
}
