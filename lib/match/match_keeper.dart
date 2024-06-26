import 'package:rf_core/match/match_setup.dart';

import '../model/i_player.dart';
import '../micro_match/micro_match_instance.dart';
import '../micro_match/micro_match_triple.dart';

class MatchKeeper {
  int _currentMatchIndex = 0;
  int _totalMatches = 0;

  late final Map<int, IPlayer> playersAtMatch = {};
  late final List<Map<String, List<int>>> _allMatches;

  final Map<int, int> playerMatchesPoints = {};
  final Map<int, int> matchesResult = {2: 0, 1: 0, 0: 0};

  MatchKeeper(List<IPlayer> players, List<Map<String, List<int>>> allMatches) {
    _totalMatches = allMatches.length;
    for (var player in players) {
      playersAtMatch.putIfAbsent(player.getPos(), () => player);
    }

    for (var player in playersAtMatch.values) {
      playerMatchesPoints[player.getPos()] = 0;
    }

    _allMatches = allMatches;
    final Map<int, IPlayer> calculated =
        PlayerFeeCalculator.prepareForStartingTourney(playersAtMatch);
    playersAtMatch.updateAll((key, value) => calculated[key]!);
  }

  MicroMatch? getNextMicroMatchPair() {
    int nextIndex = _currentMatchIndex + 1;
    if (_totalMatches < nextIndex) {
      return null;
    }
    Map<String, List<int>> triples = _allMatches[_currentMatchIndex];
    List<IPlayer> homes = _getTriples(triples['home'] ?? []);
    MicroMatchTriple homeTriple = MicroMatchTriple('home', homes);
    List<IPlayer> aways = _getTriples(triples['away'] ?? []);
    MicroMatchTriple awayTriple = MicroMatchTriple('away', aways);
    _currentMatchIndex = nextIndex;
    return MicroMatch(homeTriple, awayTriple, _currentMatchIndex);
  }

  List<IPlayer> _getTriples(List<int> pairs) {
    return pairs.map((int e) => playersAtMatch[e] as IPlayer).toList();
  }

  Map<int, int> updatePlayerPointAfterMatch(MicroMatch microMatch) {
    int? points = microMatch.calculateWinPoints();
    if (points! == 1) {
      _updateMatchPoints(
          microMatch.homeTriple, null, points);
      _updateMatchPoints(
          microMatch.awayTriple, null, points);
    } else {
      points > 0
          ? _updateMatchPoints(
              microMatch.homeTriple, microMatch.awayTriple, points)
          : _updateMatchPoints(
              microMatch.awayTriple, microMatch.homeTriple, points);
    }

    int? matchPoints = microMatch.calculateMatchPoints();
    matchesResult.update(matchPoints!, (value) => ++value);

    return playerMatchesPoints;
  }

  void _updateMatchPoints(
      MicroMatchTriple? triple, MicroMatchTriple? zeroTriple, int points) {
    points = points < 0 ? points.abs() : points;
    if (triple != null) {
      for (var player in triple.players) {
        playerMatchesPoints.update(player.getPos(), (value) => value + points);

        playersAtMatch.update(
          player.getPos(),
          (value) => value.copyWith(
              score: value.getScore() + points,
              matchesQnt: value.getMatchesQnt() + 1),
        );
      }
    }

    if (zeroTriple != null) {
      for (var player in zeroTriple.players) {
        playersAtMatch.update(
          player.getPos(),
          (value) => value.copyWith(matchesQnt: value.getMatchesQnt() + 1),
        );
      }
    }
  }
}
