import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:rf_core/micro_match/micro_match.dart';
import 'match_utils.dart';
import 'match_keeper.dart';

class MatchCalculator {
  final int _totalBalls;
  final Map<int, int> _matchesResult;
  final Map<int, MatchPlayer> _playersAtMatch;
  final Map<int, int> _playerMatchesPoints;

  MatchCalculator(MatchKeeper keeper)
      : _totalBalls = MatchPlayer.matchBallsSum!,
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

    _playersAtMatch.values.map((player) {
      int pos = player.getPos()!;
      double newBallsD = roundDouble(_playerMatchesPoints[pos]! * pointCost, 2);
      int endFee = newBallsD.truncate();
      double fraction = newBallsD - endFee;
      int? oldMatchBall = player.startFee;
      int updateRange = player.getRange()! - oldMatchBall! + endFee;
      player.endFee = endFee;
      player.endFraction = roundDouble(fraction, 2);
      debugPrint(
          '${player.getPos()}. ${player.getFirstName()}\t\t\t${player.getRange()} - $oldMatchBall * $endFee ($newBallsD -> $endFee ${player.endFraction}) = $updateRange');
    }).toList();

    int delta = checkOnChangeRange(_playersAtMatch);
    if (delta > 0) {
      addAdditionalFee(_playersAtMatch, delta);
    }
    test(_playersAtMatch);

    List<IPlayer>? updatedPlayers = _playersAtMatch.values
        .map((e) => e.copyWith(range: e.getNewRange()!))
        .toList();
    updatedPlayers.sort((r1, r2) => r2.getRange()! - r1.getRange()!);
    return updatedPlayers;
  }

  int checkOnChangeRange(Map<int, MatchPlayer> playersAtMatch) {
    int totalNewRange = playersAtMatch.values
        .map((e) => e.endFee!)
        .fold(0, (p, c) => p + c);
    int totalOldRange = playersAtMatch.values
        .map((e) => e.startFee!)
        .fold(0, (p, c) => p + c);
    return (totalNewRange - totalOldRange).abs();
  }

  void test(
    Map<int, MatchPlayer> playersAtMatch,
  ) {
    int totalOldRange = playersAtMatch.values
        .map((e) => e.getRange())
        .fold(0, (p, c) => p + c!);
    int startFees = playersAtMatch.values
        .map((e) => e.startFee)
        .fold(0, (previousValue, element) => previousValue + element!);
    int endFees = playersAtMatch.values
        .map((e) => e.endFee)
        .fold(0, (p, c) => p + c!);
    int totalNewRange = playersAtMatch.values.map((e) => e.getNewRange())
        .fold(0, (previousValue, element) => previousValue + element!);
    debugPrint(
        'Всего \t\t\t$totalOldRange - $startFees + $endFees = $totalNewRange');
  }

  void addAdditionalFee(Map<int, MatchPlayer> playersAtMatch, int delta) {
    List<MatchPlayer> mps = playersAtMatch.values.toList();
    mps.sort((a, b) {
      double aD = a.endFraction!;
      double bD = b.endFraction!;
      return bD.compareTo(aD);
    });

    for (int i = 0; i < delta; i++) {
      MatchPlayer? mp = playersAtMatch[mps[i+1].getPos()];
      mp?.additionalFee = 1;
      debugPrint(
          '${mp?.getPos()}. ${mp?.getFirstName()} (${mp?.endFraction})  + 1 балл ');
    }
  }
}
