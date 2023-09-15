import 'package:flutter/cupertino.dart';
import 'package:rf_core/judge.dart';
import 'package:rf_core/micro_match/micro_match.dart';

void emulateGame(List<IPlayer> players, List<List<int>> microMatchResults){
  final match = Judge(players: players);
  for (var result in microMatchResults) {
    MicroMatch? mm = match.getNextMicroMatchPair();
    mm?.setResult(result[0], result[1]);
    if(mm == null) break;
    match.updatePlayerPointAfterMatch(mm);
  }
  List<IPlayer>? updatePlayerResults = match.calculateResults();
  debugPrint("\nИтого:");
  updatePlayerResults?.forEach((player) {
    debugPrint(
        '${player.getPos()}. ${player.getUser().getFirstName()}\t\t\t${player.getUser().getRange()}\t\t\t${player.getDeltaRange()}');
  });
  debugPrint("________________________\n");
}