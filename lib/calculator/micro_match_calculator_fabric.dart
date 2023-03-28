import 'package:rf_core/persons_ranking/persons.dart';
import 'package:rf_core/micro_match/micro_match.dart';

import 'micro_match_calculator.dart';

MicroMatchCalculator? create({required List<IPlayer> players}) {
  List<Map<String, List<int>>> allMatches = Persons.allMatches;
  int playerQnt = players.length;
  if (playerQnt == 6) {
    allMatches = SixPersons.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  if (playerQnt == 7) {
    allMatches = SevenPersons.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  if (playerQnt == 8) {
    allMatches = EightPersons.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  if (playerQnt == 9) {
    allMatches = NinePersons.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  throw Exception('selected player');
}