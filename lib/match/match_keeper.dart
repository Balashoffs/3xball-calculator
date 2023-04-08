import 'package:rf_core/match/match_setup.dart';

import '../i_player.dart';
import 'match_player.dart';
import 'match_utils.dart';
import '../micro_match/micro_match_instance.dart';
import '../micro_match/micro_match_triple.dart';

class MatchKeeper{
  MatchSetup? matchSetup;
  int _currentMatchIndex = 0;

  late final Map<int, MatchPlayer> playersAtMatch = {};
  late final List<Map<String, List<int>>> _allMatches;

  final Map<int, int> playerMatchesPoints = {};
  final Map<int, int> matchesResult = {2: 0, 1: 0, 0: 0};


  MatchKeeper(List<IPlayer> players, List<Map<String, List<int>>> allMatches){
    _allMatches = allMatches;
    matchSetup = MatchSetup(players);

    var playersMicroMatchQnt = calculatePlayersMicroMatchQnt(allMatches);

    players
        .map((player) => MatchPlayer(
        pos: player.getPos(),
        fullName: player.getFullName(),
        range: player.getRange(),
        matchesQnt: playersMicroMatchQnt[player.getPos()]))
        .forEach((player) {
      playersAtMatch[player.getPos()!] = player;
    });

    for (var player in playersAtMatch.values) {
      playerMatchesPoints[player.getPos()!] = 0;
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
    return pairs.map((int e) => playersAtMatch[e] as MatchPlayer).toList();
  }

  void updatePlayerPointAfterMatch(MicroMatch microMatch) {
    int? points = microMatch.calculateWinPoints();
    if (points! == 1) {
      List<int> allPos = microMatch.getAllPosAtMicroMatch();
      for (var pos in allPos) {
        playerMatchesPoints.update(pos, (value) => value + points);
      }
    } else {
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
      playerMatchesPoints.update(player.getPos()!, (value) => value + points);
    }
  }
}