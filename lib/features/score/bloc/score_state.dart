part of 'score_bloc.dart';

abstract class ScoreState extends Equatable {
  const ScoreState();

  @override
  List<Object> get props => [];
}

class ScoreLoading extends ScoreState {}

class ScoreLoaded extends ScoreState {
  const ScoreLoaded({required this.score});
  final Score score;
  @override
  List<Object> get props => [score];
}

class ScoreError extends ScoreState {}
