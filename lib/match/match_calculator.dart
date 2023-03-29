import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:rf_core/match/match_setup.dart';
import 'package:rf_core/micro_match/micro_match.dart';

import 'match_utils.dart';
import 'match_keeper.dart';

class MatchCalculator {
  final int _totalBalls;
  final List<PlayerMatchOdds> _playersMatchOdds;
  final Map<int, int> _matchesResult;
  final Map<int, MatchPlayer> _playersAtMatch;
  final Map<int, int> _playerMatchesPoints;

  MatchCalculator(MatchKeeper keeper)
      : _totalBalls = keeper.matchSetup!.matchBallsSum,
        _playersMatchOdds = keeper.matchSetup!.playersMatchOdds,
        _matchesResult = keeper.matchesResult,
        _playersAtMatch = keeper.playersAtMatch,
        _playerMatchesPoints = keeper.playerMatchesPoints;

  List<IPlayer> calculateResults() {
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

    Map<int, int> updateBalls = {};

    List<IPlayer> updatePlayers =
        _playersAtMatch.values.map((MatchPlayer player) {
      int pos = player.getPos()!;
      int newBalls = (_playerMatchesPoints[pos]! * pointCost).round();
      int? oldMatchBall = _playersMatchOdds[pos - 1].matchBalls;
      int updateRange = player.getRange()! - oldMatchBall! + newBalls;
      updateBalls[pos] =newBalls;
      debugPrint(
          '${player.getPos()}. ${player.getFullName()}\t\t\t${player.getRange()} - $oldMatchBall * $newBalls = $updateRange');
      return player.copyWith(range: updateRange);
    }).toList();
    test(_playersAtMatch, _playersMatchOdds, updatePlayers, updateBalls);
    updatePlayers.sort((r1, r2) => r2.getRange()! - r1.getRange()!);

    return updatePlayers;
  }

  void test(Map<int, MatchPlayer> playersAtMatch, List<PlayerMatchOdds> playersMatchOdds, List<IPlayer> updatePlayers, Map<int, int> updateBalls) {
    int totalOldRange = playersAtMatch.values.map((e) => e.getRange()).fold(0, (p, c) => p + c!);
    int oldBalls = playersMatchOdds.map((e) => e.matchBalls).fold(0, (previousValue, element) => previousValue + element!);
    int totalNewRange = updatePlayers.map((e) => e.getRange()).fold(0, (p, c) => p + c!);
    int newBalls = updateBalls.values.fold(0, (previousValue, element) => previousValue + element);
    debugPrint(
        'Всего \t\t\t$totalOldRange - $oldBalls + $newBalls = $totalNewRange');
  }





}
