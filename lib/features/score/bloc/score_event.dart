part of 'score_bloc.dart';

abstract class ScoreEvent extends Equatable {
  const ScoreEvent();
}

class ScoreStarted extends ScoreEvent {
  @override
  List<Object> get props => [];
}

class ScoreChanged extends ScoreEvent {
  const ScoreChanged(this.score);

  final Score score;

  @override
  List<Object> get props => [score];
}
