import 'package:rf_core/match/match_keeper.dart';
import 'package:rf_core/players_micro_match_qnt/players.dart';
import 'package:rf_core/micro_match/micro_match.dart';

MatchKeeper create(List<IPlayer> players) {
  List<Map<String, List<int>>> allMatches = Players.allMatches;
  int playerQnt = players.length;
  if (playerQnt == 6) {
    allMatches = SixPlayers.allMatches;
    return MatchKeeper(players, allMatches);
  }
  if (playerQnt == 7) {
    allMatches = SevenPlayers.allMatches;
    return MatchKeeper(players, allMatches);
  }
  if (playerQnt == 8) {
    allMatches = EightPlayers.allMatches;
    return MatchKeeper(players, allMatches);
  }
  if (playerQnt == 9) {
    allMatches = NinePlayers.allMatches;
    return MatchKeeper(players, allMatches);
  }
  throw Exception('selected player');
}
