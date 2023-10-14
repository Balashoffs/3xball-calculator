import 'package:flutter/foundation.dart';
import 'package:rf_core/micro_match/micro_match.dart';
import '../model/player_fee.dart';
import 'match_utils.dart';
import 'match_keeper.dart';

class MatchCalculator {
  final int _totalBalls;
  final Map<int, int> _matchesResult;
  final Map<int, IPlayer> _playersAtMatch;
  final Map<int, int> _playerMatchesPoints;

  MatchCalculator(MatchKeeper keeper)
      : _totalBalls = IPlayer.matchBallsSum!,
        _matchesResult = keeper.matchesResult,
        _playersAtMatch = keeper.playersAtMatch,
        _playerMatchesPoints = keeper.playerMatchesPoints;

  List<IPlayer>? calculateResults() {
    int? totalPoints = _matchesResult.entries
        .map((e) => {
              e.key == 2
                  ? e.value * 3 * 3
                  : e.key == 1
                      ? e.value * 3 * 2
                      : e.value * 6 * 1
            })
        .expand((element) => element)
        .toList()
        .fold(0, (previousValue, element) => previousValue! + element);
    debugPrint('Всего очков: $totalPoints');
    double pointCost = _totalBalls / totalPoints!;
    pointCost = roundDouble(pointCost, 2);

    debugPrint('Стоимость каждого очка $_totalBalls/$totalPoints = $pointCost');

    List<PlayerFee> players = _playersAtMatch.values.map((player) {
      int pos = player.getPos();
      double newBallsD = roundDouble(_playerMatchesPoints[pos]! * pointCost, 2);
      int endFee = newBallsD.truncate();
      double fraction = newBallsD - endFee;
      PlayerFee playerFee = player.getPlayerFee()!;
      double endFraction = roundDouble(fraction, 2);
      return playerFee.copyWith(endFraction: endFraction, endFee: endFee);
    }).toList();

    int delta = checkOnChangeRange(players);
    print('delta: $delta');

    List<IPlayer>? updatedPlayers = _playersAtMatch.values.map((e) {
      PlayerFee pf = players
          .where((element) => element.getId() == e.getUser().getId())
          .first;
      int deltaRange =
           pf.getEndFee() - pf.getStartFee();
      debugPrint('${pf.getId()}: $deltaRange');
      return e.copyWith(
          delta: deltaRange,
          playerFee: pf);
    }).toList();

    for (var element in updatedPlayers) {debugPrint(element.toString());}
    updatedPlayers.sort((r1, r2) =>
        (r2.getDeltaRange() + r2.getUser().getRange()) -
        (r1.getDeltaRange() + r1.getUser().getRange()));

    if (delta > 0) {
      for(int i = 0; i < delta; i++){
      IPlayer player = updatedPlayers[i];
        updatedPlayers[i] = player.copyWith(delta: player.getDeltaRange() + 1);
      }
    }

    return updatedPlayers;
  }

  int checkOnChangeRange(List<PlayerFee> playersAtMatch) {
    int totalNewRange =
        playersAtMatch.map((e) => e.getEndFee()).fold(0, (p, c) => p + c);
    int totalOldRange =
        playersAtMatch.map((e) => e.getStartFee()).fold(0, (p, c) => p + c);
    return (totalNewRange - totalOldRange).abs();
  }

  List<PlayerFee> addAdditionalFee(List<PlayerFee> playersAtMatch, int delta) {
    List<PlayerFee> updated =
        playersAtMatch.map((e) => e.copyWith(additionalFee: 1)).toList();
    // updated.sort((a, b) {
    //   double aD = a.endFraction;
    //   double bD = b.endFraction;
    //   return bD.compareTo(aD);
    // });
    return updated;
  }
}
