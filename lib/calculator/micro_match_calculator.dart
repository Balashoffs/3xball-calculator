import 'package:rf_core/micro_match/micro_match.dart';



class MicroMatchCalculator {
  int _currentMatchIndex = 0;
  late final int feesSum;

  late final List<MatchPlayer> _playersAtMatch;
  late final List<Map<String, List<int>>> _allMatches;

  final Map<int, int> _playerMatchesPoints = {};
  final Map<int, int> matchesResult = {2: 0, 1: 0, 0: 0};

  MicroMatchCalculator(
      {required List<IPlayer> players,
      required List<Map<String, List<int>>> allMatches}) {
    _allMatches = allMatches;

    var playersMicroMatchQnt = calculatePlayersMicroMatchQnt(allMatches);

    _playersAtMatch = players
        .map((player) => MatchPlayer(
            pos: player.getPos(),
            fullName: player.getFullName(),
            range: player.getRange(),
            matchesQnt: playersMicroMatchQnt[player.getPos()]))
        .toList();

    feesSum = _playersAtMatch
        .map((e) => e.balls)
        .fold(0, (previousValue, element) => previousValue + element!);

    for (var player in _playersAtMatch) {
      player.partOfRangeAtPercent = player.balls! / feesSum + 1;
    }

    for (var player in _playersAtMatch) {
      _playerMatchesPoints[player.getPos()!] = 0;
    }
  }

  MicroMatch getNextMicroMatchPair() {
    _currentMatchIndex++;
    var triples = _allMatches[_currentMatchIndex];
    List<MatchPlayer> homes = triples['home']
        ?.map((e) => _playersAtMatch[e])
        .toList() as List<MatchPlayer>;
    MicroMatchTriple homeTriple = MicroMatchTriple('home', homes);
    List<MatchPlayer> aways = triples['away']
        ?.map((e) => _playersAtMatch[e])
        .toList() as List<MatchPlayer>;
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

    int? matchPoints = microMatch.calculateMatchPoints();
    matchesResult.update(matchPoints!, (value) => value++);
  }

  void _updateMatchPoints(MicroMatchTriple triple, int points) {
    for (var player in triple.players) {
      _playerMatchesPoints.update(player.getPos()!, (value) => value + points);
    }
  }

  List<IPlayer> calculateResults() {
    int? totalBalls = _playersAtMatch
        .map((e) => e.balls)
        .fold(0, (previousValue, element) => previousValue! + element!);
    int? totalPoints = matchesResult.values
        .fold(0, (previousValue, element) => previousValue! + element);
    double pointCost = totalBalls! / totalPoints!;

    return _playersAtMatch.map((player) {
      int? newBalls =
          (_playerMatchesPoints[player.getPos()!]! * pointCost).round();
      return player.copyWith(range: newBalls);
    }).toList();
  }
}
