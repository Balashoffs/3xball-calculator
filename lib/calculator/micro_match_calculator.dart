import 'dart:developer';

import 'package:rf_core/micro_match/micro_match.dart';

class MicroMatchCalculator {
  int _currentMatchIndex = 0;
  late final int feesSum;

  late final Map<int, MatchPlayer> _playersAtMatch = {};
  late final List<Map<String, List<int>>> _allMatches;

  final Map<int, int> _playerMatchesPoints = {};
  final Map<int, int> matchesResult = {2: 0, 1: 0, 0: 0};

  MicroMatchCalculator(
      {required List<IPlayer> players,
      required List<Map<String, List<int>>> allMatches}) {
    _allMatches = allMatches;

    var playersMicroMatchQnt = calculatePlayersMicroMatchQnt(allMatches);

    players
        .map((player) => MatchPlayer(
            pos: player.getPos(),
            fullName: player.getFullName(),
            range: player.getRange(),
            matchesQnt: playersMicroMatchQnt[player.getPos()]))
        .forEach((player) {
      _playersAtMatch[player.getPos()!] = player;
      print(player);
    });

    feesSum = _playersAtMatch.values
        .map((e) => e.balls)
        .fold(0, (previousValue, element) => previousValue + element!);

    for (var player in _playersAtMatch.values) {
      double atPercent =  player.balls! / feesSum + 1;
      player.partOfRangeAtPercent = roundDouble(atPercent, 2);
    }

    for (var player in _playersAtMatch.values) {
      _playerMatchesPoints[player.getPos()!] = 0;
    }
  }

  MicroMatch getNextMicroMatchPair() {
    Map<String, List<int>> triples = _allMatches[_currentMatchIndex];
    List<MatchPlayer>? homes = _getTriples(triples['home']!);
    MicroMatchTriple homeTriple = MicroMatchTriple('home', homes);
    List<MatchPlayer> aways = _getTriples(triples['away']!);
    MicroMatchTriple awayTriple = MicroMatchTriple('away', aways);
    _currentMatchIndex = _currentMatchIndex + 1;
    return MicroMatch(homeTriple, awayTriple, _currentMatchIndex);
  }

  List<MatchPlayer> _getTriples(List<int> pairs) {
    return pairs.map((int e) => _playersAtMatch[e] as MatchPlayer).toList();
  }

  void updatePlayerPointAfterMatch(MicroMatch microMatch) {
    int? points = microMatch. calculateWinPoints();
    if (points! == 1) {
      List<int> allPos = microMatch.getAllPosAtMicroMatch();
      for (var pos in allPos) {
        _playerMatchesPoints.update(pos, (value) => value + points);
      }
    }else{
      points > 0
          ? _updateMatchPoints(microMatch.homeTriple, points)
          : _updateMatchPoints(microMatch.awayTriple, points);
    }

    int? matchPoints = microMatch.calculateMatchPoints();
    matchesResult.update(matchPoints!, (value) => ++value);
  }

  void _updateMatchPoints(MicroMatchTriple triple, int points) {
    for (var player in triple.players) {
      points = points.abs();
      _playerMatchesPoints.update(player.getPos()!, (value) => value + points);
    }
  }

  List<IPlayer> calculateResults() {
    print('two balls: ${matchesResult[2]}, one ball: ${matchesResult[1]}, zero ball: ${matchesResult[0]}\n');

    int? totalBalls = _playersAtMatch.values
        .map((e) => e.balls)
        .fold(0, (previousValue, element) => previousValue! + element!);
    print('total balls: $totalBalls\n');
    int? totalPoints = matchesResult.entries
        .map((e) => {
              e.key == 2
                  ? e.value * 3 * 3
                  : e.key == 1
                      ? e.value * 3 * 2
                      : e.value * 6 * 1
            }).expand((element) => element)
        .toList().fold(0, (previousValue, element) => previousValue! + element);
    print('total points: $totalPoints\n');
    double pointCost = totalBalls! / totalPoints!;
    pointCost = roundDouble(pointCost, 2);
    print('point cost: $pointCost\n');
    _playerMatchesPoints.forEach((key, value) {print('${_playersAtMatch[key]?.getFullName()}: $value');});
    return _playersAtMatch.values.map((player) {
      int? newBalls =
          (_playerMatchesPoints[player.getPos()!]! * pointCost).round();
      int total = player.getRange()! - player.balls! + newBalls ;
      print('${player.getFullName()}\t ${_playerMatchesPoints[player.getPos()!]} ones * $pointCost = $newBalls');
      return player.copyWith(range: total);
    }).toList();
  }
}
