import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rf_core/micro_match/micro_match.dart';
import 'package:rf_core/judge.dart';

void main() {
  test('calculate range for 6 players', () {
    debugPrint("Расчет для 6 игроков");
    MatchPlayer matchPlayer1 =
        MatchPlayer(pos: 1, firstName: 'Аваков', range: 2105);
    MatchPlayer matchPlayer2 =
        MatchPlayer(pos: 2, firstName: 'Бурунов', range: 2050);
    MatchPlayer matchPlayer3 =
        MatchPlayer(pos: 3, firstName: 'Виторган', range: 2034);
    MatchPlayer matchPlayer4 =
        MatchPlayer(pos: 4, firstName: 'Гоша', range: 1960);
    MatchPlayer matchPlayer5 =
        MatchPlayer(pos: 5, firstName: 'Демчук', range: 1918);
    MatchPlayer matchPlayer6 =
        MatchPlayer(pos: 6, firstName: 'Ерофеев', range: 1856);

    List<List<int>> microMatchResults = [
      [2, 0],
      [1, 2],
      [1, 1],
      [2, 0],
      [0, 0],
      [1, 2],
      [2, 1],
      [1, 2],
      [0, 2],
      [1, 2]
    ];

    List<IPlayer> players = [
      matchPlayer1,
      matchPlayer2,
      matchPlayer3,
      matchPlayer4,
      matchPlayer5,
      matchPlayer6
    ];

    final match = Judge(players: players);
    for (var result in microMatchResults) {
      MicroMatch? mm = match.getNextMicroMatchPair();
      mm?.setResult(result[0], result[1]);
      match.updatePlayerPointAfterMatch(mm!);
    }
    List<IPlayer>? updatePlayerResults = match.calculateResults();
    debugPrint("\nИтого:");
    updatePlayerResults?.forEach((player) {
      debugPrint(
          '${player.getPos()}. ${player.getFirstName()}\t\t\t${player.getRange()}');
    });
    debugPrint("________________________\n");

  });

  test('calculate range for 7 players', () {
    debugPrint("Расчет для 7 игроков");
    MatchPlayer matchPlayer1 =
        MatchPlayer(pos: 1, firstName: 'Иванов', range: 2567);
    MatchPlayer matchPlayer2 =
        MatchPlayer(pos: 2, firstName: 'Петров', range: 2376);
    MatchPlayer matchPlayer3 =
        MatchPlayer(pos: 3, firstName: 'Сидоров', range: 2235);
    MatchPlayer matchPlayer4 =
        MatchPlayer(pos: 4, firstName: 'Кузнецов', range: 2037);
    MatchPlayer matchPlayer5 =
        MatchPlayer(pos: 5, firstName: 'Рыбаков', range: 1816);
    MatchPlayer matchPlayer6 =
        MatchPlayer(pos: 6, firstName: 'Гагарин', range: 1768);
    MatchPlayer matchPlayer7 =
        MatchPlayer(pos: 7, firstName: 'Котов', range: 1691);

    List<List<int>> microMatchResults = [
      [2, 0],
      [1, 2],
      [1, 1],
      [2, 0],
      [2, 1],
      [1, 2],
      [2, 0],
      [1, 2],
      [0, 2],
      [2, 1],
      [1, 1],
      [0, 0]
    ];

    List<IPlayer> players = [
      matchPlayer1,
      matchPlayer2,
      matchPlayer3,
      matchPlayer4,
      matchPlayer5,
      matchPlayer6,
      matchPlayer7
    ];


    final match = Judge(players: players);
    for (var result in microMatchResults) {
      MicroMatch? mm = match.getNextMicroMatchPair();
      mm?.setResult(result[0], result[1]);
      match.updatePlayerPointAfterMatch(mm!);
    }

    List<IPlayer>? updatePlayerResults = match.calculateResults();
    debugPrint("\nИтого:");
    updatePlayerResults?.forEach((player) {
      debugPrint(
          '${player.getPos()}. ${player.getFirstName()}\t\t\t${player.getRange()}');
    });
    debugPrint("________________________\n");
  });

  test('calculate range for 8 players', () {
    debugPrint("Расчет для 8 игроков");
    MatchPlayer matchPlayer1 =
        MatchPlayer(pos: 1, firstName: 'Крутов', range: 2476);
    MatchPlayer matchPlayer2 =
        MatchPlayer(pos: 2, firstName: 'Ларионов', range: 2385);
    MatchPlayer matchPlayer3 =
        MatchPlayer(pos: 3, firstName: 'Макаров', range: 2290);
    MatchPlayer matchPlayer4 =
        MatchPlayer(pos: 4, firstName: 'Овечкин', range: 2104);
    MatchPlayer matchPlayer5 =
        MatchPlayer(pos: 5, firstName: 'Буре', range: 1916);
    MatchPlayer matchPlayer6 =
        MatchPlayer(pos: 6, firstName: 'Семенов', range: 1898);
    MatchPlayer matchPlayer7 =
        MatchPlayer(pos: 7, firstName: 'Третьяк', range: 1793);
    MatchPlayer matchPlayer8 =
        MatchPlayer(pos: 8, firstName: 'Малкин', range: 1788);

    List<List<int>> microMatchResults = [
      [2, 1],
      [2, 0],
      [2, 1],
      [1, 1],
      [1, 2],
      [0, 2],
      [2, 0],
      [1, 1],
      [0, 2],
      [2, 1],
      [0, 0],
      [0, 2],
    ];

    List<IPlayer> players = [
      matchPlayer1,
      matchPlayer2,
      matchPlayer3,
      matchPlayer4,
      matchPlayer5,
      matchPlayer6,
      matchPlayer7,
      matchPlayer8,
    ];

    final match = Judge(players: players);
    for (var result in microMatchResults) {
      MicroMatch? mm = match.getNextMicroMatchPair();
      mm?.setResult(result[0], result[1]);
      match.updatePlayerPointAfterMatch(mm!);
    }
    List<IPlayer>? updatePlayerResults = match.calculateResults();
    debugPrint("\nИтого:");
    updatePlayerResults?.forEach((player) {
      debugPrint(
          '${player.getPos()}. ${player.getFirstName()}\t\t\t${player.getRange()}');
    });
    debugPrint("________________________\n");
  });

  test('calculate range for 9 players', () {
    debugPrint("Расчет для 9 игроков");
    MatchPlayer matchPlayer1 =
        MatchPlayer(pos: 1, firstName: 'Месси', range: 2530);
    MatchPlayer matchPlayer2 =
        MatchPlayer(pos: 2, firstName: 'Роналду', range: 2484);
    MatchPlayer matchPlayer3 =
        MatchPlayer(pos: 3, firstName: 'Пеле', range: 2453);
    MatchPlayer matchPlayer4 =
        MatchPlayer(pos: 4, firstName: 'Марадона', range: 2394);
    MatchPlayer matchPlayer5 =
        MatchPlayer(pos: 5, firstName: 'Джикия', range: 2368);
    MatchPlayer matchPlayer6 =
        MatchPlayer(pos: 6, firstName: 'Санчес', range: 2257);
    MatchPlayer matchPlayer7 =
        MatchPlayer(pos: 7, firstName: 'Мюллер', range: 2193);
    MatchPlayer matchPlayer8 =
        MatchPlayer(pos: 8, firstName: 'Клопп', range: 2174);
    MatchPlayer matchPlayer9 =
        MatchPlayer(pos: 9, firstName: 'Бензема', range: 2147);

    List<List<int>> microMatchResults = [
      [1, 1],
      [2, 1],
      [0, 1],
      [2, 0],
      [2, 0],
      [1, 1],
      [0, 2],
      [2, 1],
      [2, 0],
      [1, 2],
      [1, 2],
      [2, 1],
      [2, 1],
      [2, 0],
      [1, 2],
    ];

    List<IPlayer> players = [
      matchPlayer1,
      matchPlayer2,
      matchPlayer3,
      matchPlayer4,
      matchPlayer5,
      matchPlayer6,
      matchPlayer7,
      matchPlayer8,
      matchPlayer9,
    ];

    final match = Judge(players: players);
    for (var result in microMatchResults) {
      MicroMatch? mm = match.getNextMicroMatchPair();
      mm?.setResult(result[0], result[1]);
      match.updatePlayerPointAfterMatch(mm!);
    }

    List<IPlayer>? updatePlayerResults = match.calculateResults();
    debugPrint("\nИтого:");
    updatePlayerResults?.forEach((player) {
      debugPrint(
          '${player.getPos()}. ${player.getFirstName()}\t\t\t${player.getRange()}');
    });
    debugPrint("________________________\n");
  });
}
