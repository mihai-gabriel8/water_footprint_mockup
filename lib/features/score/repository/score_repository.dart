import 'dart:async';

import 'package:water_footprint/features/score/models/score.dart';

const _delay = Duration(milliseconds: 500);

class ScoreRepository {
  var _score = Score(score: 0);

  Future<Score> loadScore() => Future.delayed(_delay, () => _score);
  final _controller = StreamController<Score>();

  /// By subscribing, AuthenticationBloc will listen to this
  Stream<Score> get score async* {
    await Future<void>.delayed(const Duration(seconds: 2));
    yield* _controller.stream;
  }

  // Stream<Score> updateScore({required Score score}) {

  // }

  void changeScore(Score score) => _score = score;
}
