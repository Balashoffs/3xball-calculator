import 'package:flutter/foundation.dart';
import 'package:rf_core/match/match.dart';

class PlayerFeeCalculator {
  static const double _inputPercentOfPersonalRate = 0.02;
  static const Map<int, List<int>> _matchOdds = {
    6: [10, 10, 10, 10, 10, 10],
    7: [11, 11, 10, 10, 10, 10, 10],
    8: [9, 9, 9, 9, 9, 9, 9, 9],
    9: [10, 10, 10, 10, 10, 10, 10, 10, 10],
  };


  static void calculate(Map<int, MatchPlayer> players) {
    _preparePlayerOdds(players);
    _prepareMatchOdds(players);
  }

  static void _preparePlayerOdds(Map<int, MatchPlayer> players) {
    List<int>? odds = _matchOdds[players.length];
    for (var kv in players.entries) {
      MatchPlayer player = kv.value;
      int microMatchQnt = odds![player.getPos() - 1];
      int? matchBalls = _fee(microMatchQnt, player.getRange());
      debugPrint(
          '${player.getPos()}. ${player.getFirstName()}\t\t${player.getRange()} * $_inputPercentOfPersonalRate * $microMatchQnt = $matchBalls');
      player.startFee = matchBalls;
    }
  }

  static void _prepareMatchOdds(Map<int, MatchPlayer> players) {
    int matchBallsSum = players.values
        .map((player) => player.startFee)
        .fold(0, (previousValue, element) => previousValue + element!);

    debugPrint('Всего взносов: $matchBallsSum');

    for (var kv in players.entries) {
      MatchPlayer player = kv.value;
      double atPercent = player.startFee! / matchBallsSum + 1;
      player.matchBallsAsPercent = roundDouble(atPercent, 2);
    }

    MatchPlayer.matchBallsSum = matchBallsSum;
  }

  static int? _fee(int matchesQnt, int range) {
    double fee = _inputPercentOfPersonalRate * matchesQnt * range;
    //Previous version of input balls
    // double fraction = fee - fee.truncate();
    // int plusOne = fraction.compareTo(0.5) >= 0 ? 0 : 1;
    // return fraction.compareTo(0.0) != 0 ? fee.round() + plusOne : fee.round();
    return fee.round();
  }
}
