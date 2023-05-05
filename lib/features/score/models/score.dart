import 'package:equatable/equatable.dart';

class Score extends Equatable {
  const Score({this.score = 0});

  final num score;

  @override
  List<Object?> get props => [];
}
