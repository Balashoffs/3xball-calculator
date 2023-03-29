import 'package:flutter/foundation.dart';

import '../i_player.dart';
import 'match_utils.dart';

class MatchSetup {
  static const double _inputPercentOfPersonalRate = 0.02;
  static const Map<int, List<int>> _matchOdds = {
    6: [10, 10, 10, 10, 10, 10],
    7: [11, 11, 10, 10, 10, 10, 10],
    8: [9, 9, 9, 9, 9, 9, 9, 9],
    9: [10, 10, 10, 10, 10, 10, 10, 10, 10],
  };

  List<PlayerMatchOdds> playersMatchOdds = [];
  late final int matchBallsSum;
  MatchSetup(List<IPlayer> players) {
    _preparePlayerOdds(players);
    _prepareMatchOdds();
  }

  void _preparePlayerOdds(List<IPlayer> players) {
    List<int>? odds = _matchOdds[players.length];
    for (var value in players) {
      int microMatchQnt = odds![value.getPos()! - 1];
      int? matchBalls = _fee(microMatchQnt, value.getRange()!);
      debugPrint(
          '${value.getPos()}. ${value.getFullName()}\t\t${value.getRange()} * $_inputPercentOfPersonalRate * $microMatchQnt = $matchBalls');
      PlayerMatchOdds pmo = PlayerMatchOdds(value.getPos(), matchBalls);
      playersMatchOdds.add(pmo);
    }
  }

  void _prepareMatchOdds() {
    matchBallsSum = playersMatchOdds
        .map((e) => e.matchBalls)
        .fold(0, (previousValue, element) => previousValue + element!);

    debugPrint('Всего взносов: $matchBallsSum');

    for (var playerOdds in playersMatchOdds) {
      double atPercent = playerOdds.matchBalls! / matchBallsSum + 1;
      playerOdds.matchBallsAsPercent = roundDouble(atPercent, 2);
    }
  }

  int? _fee(int matchesQnt, int range) {
    double fee = _inputPercentOfPersonalRate * matchesQnt * range;
    double fraction = fee - fee.truncate();
    int plusOne = fraction.compareTo(0.5) >= 0 ? 0 : 1;
    return fraction.compareTo(0.0) != 0 ? fee.round() + plusOne : fee.round();
  }
}

class PlayerMatchOdds {
  final int? pos;
  final int? matchBalls;
  double? matchBallsAsPercent;

  PlayerMatchOdds(this.pos, this.matchBalls);
}
