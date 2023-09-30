import 'package:rf_core/micro_match/micro_match.dart';

import 'match/match.dart';

class Judge {
  MatchCalculator? _calculator;
  final MatchKeeper _mathKeeper;

  final int _totalMatches;

  int get totalMatches => _totalMatches;

  Judge({required List<IPlayer> players})
      : _totalMatches = players.length,
        _mathKeeper = create(players);

  MicroMatch? getNextMicroMatchPair() {
    return _mathKeeper.getNextMicroMatchPair();
  }

  Map<int, int> updatePlayerPointAfterMatch(MicroMatch microMatch) {
    return _mathKeeper.updatePlayerPointAfterMatch(microMatch);
  }

  List<IPlayer>? calculateResults() {
    _calculator = MatchCalculator(_mathKeeper);
    return _calculator?.calculateResults();
  }
}
