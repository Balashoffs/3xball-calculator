import 'package:flutter/foundation.dart';
import 'package:rf_core/model/i_player.dart';
import 'package:rf_core/match/match.dart';

import '../model/player_fee.dart';

class PlayerFeeCalculator {
  static const double _inputPercentOfPersonalRate = 0.02;
  static const Map<int, List<int>> _matchOdds = {
    6: [10, 10, 10, 10, 10, 10],
    7: [11, 11, 10, 10, 10, 10, 10],
    8: [9, 9, 9, 9, 9, 9, 9, 9],
    9: [10, 10, 10, 10, 10, 10, 10, 10, 10],
  };

  static Map<int, IPlayer> prepareForStartingTourney(Map<int, IPlayer> players) {
    Map<String, PlayerFee> playerFees = _preparePlayerOdds(players);
    return _prepareMatchOdds(players, playerFees);
  }

  static Map<String, PlayerFee> _preparePlayerOdds(Map<int, IPlayer> players) {
    List<int>? odds = _matchOdds[players.length];
    Map<String, PlayerFee> playerStarFees = {};
    for (var kv in players.entries) {
      IPlayer player = kv.value;
      int index = player.getPos() - 1;
      IUser user = kv.value.getUser();
      int microMatchQnt = odds![index];
      int? matchBalls = _fee(microMatchQnt, player.getUser().getRange());
      playerStarFees.putIfAbsent(user.getId(),
          () => PlayerFee(id: user.getId(), startFee: matchBalls ?? 0));
    }

    return playerStarFees;
  }

  static Map<int, IPlayer> _prepareMatchOdds(
      Map<int, IPlayer> players, Map<String, PlayerFee> playerFees) {
    int matchBallsSum = playerFees.values
        .map((player) => player.getStartFee())
        .fold(0, (previousValue, element) => previousValue + element);

    Map<int, IPlayer> updatePlayers = {};
    for (var kv in players.entries) {
      IUser user = kv.value.getUser();
      int startFee = playerFees[user.getId()]?.getStartFee() ?? 0;
      double atPercent =  startFee/ matchBallsSum + 1;
      double matchBallsAsPercent = roundDouble(atPercent, 2);
      PlayerFee playerFee = playerFees[user.getId()]!.copyWith(matchBallsAsPercent: matchBallsAsPercent);
      IPlayer updates = kv.value.copyWith(playerFee: playerFee);
      updatePlayers.putIfAbsent(updates.getPos(), () => updates);
    }

    IPlayer.matchBallsSum = matchBallsSum;

    return updatePlayers;
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
