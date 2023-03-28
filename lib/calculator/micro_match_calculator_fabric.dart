import 'package:rf_core/players_micro_match_qnt/players.dart';
import 'package:rf_core/micro_match/micro_match.dart';

import 'micro_match_calculator.dart';

MicroMatchCalculator? create({required List<IPlayer> players}) {
  List<Map<String, List<int>>> allMatches = Players.allMatches;
  int playerQnt = players.length;
  if (playerQnt == 6) {
    allMatches = SixPlayers.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  if (playerQnt == 7) {
    allMatches = SevenPlayers.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  if (playerQnt == 8) {
    allMatches = EightPlayers.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  if (playerQnt == 9) {
    allMatches = NinePlayers.allMatches;
    return MicroMatchCalculator(players: players, allMatches: allMatches);
  }
  throw Exception('selected player');
}