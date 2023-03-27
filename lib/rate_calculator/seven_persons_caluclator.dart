import 'package:rf_core/core_player.dart';
import 'package:rf_core/i_player.dart';
import 'package:rf_core/micro_match.dart';
import 'package:rf_core/micro_match_triple.dart';
import 'package:rf_core/persons_ranking/seven_persons.dart';

class SevenPersonsCalculator {
  int _currentMatchIndex = 0;
  final List<CorePlayer> _playersAtMatch = [];
  final Map<String, int> _playerMatchesPoints = {};
  final Map<int, int> matchesResult = {2: 0, 1: 0, 0: 0};

  int feesSum = -1;

  SevenPersonsCalculator({required List<IPlayer> players}) {
    players
        .map((e) => CorePlayer(
            fullName: e.getFullName(),
            range: e.getRange(),
            matchesQnt: players.length))
        .forEach((element) {
      _playersAtMatch.add(element);
    });

    feesSum = _playersAtMatch
        .map((e) => e.balls)
        .fold(0, (previousValue, element) => previousValue + element!);

    for (var player in _playersAtMatch) {
      player.ballsPercent = player.balls! / feesSum + 1;
    }

    for (var player in _playersAtMatch) {
      _playerMatchesPoints[player.getFullName()!] = 0;
    }
  }

  MicroMatch getNextMicroMatchPair() {
    _currentMatchIndex++;
    var triples = allMatches[_currentMatchIndex];
    List<CorePlayer> homes = triples['home']
        ?.map((e) => _playersAtMatch[e])
        .toList() as List<CorePlayer>;
    MicroMatchTriple homeTriple = MicroMatchTriple('home', homes);
    List<CorePlayer> aways = triples['away']
        ?.map((e) => _playersAtMatch[e])
        .toList() as List<CorePlayer>;
    MicroMatchTriple awayTriple = MicroMatchTriple('away', aways);
    return MicroMatch(homeTriple, awayTriple);
  }

  void updatePlayerPointAfterMatch(MicroMatch microMatch) {
    int? points = microMatch.calculateWinPoints();
    if (points! == 1) {
      for (var player in _playersAtMatch) {
        player.points += points;
      }
    }
    points > 0
        ? _updateMatchPoints(microMatch.homeTriple, points)
        : _updateMatchPoints(microMatch.awayTriple, points);
  }

  void _updateMatchPoints(MicroMatchTriple triple, int points) {
    for (var player in triple.players) {
      _playerMatchesPoints.update(player.getFullName()!, (value) => value + points);
    }
  }

  List<IPlayer> calculateResults(){

  }
}
