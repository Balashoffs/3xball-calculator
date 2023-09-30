import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rf_core/micro_match/micro_match.dart';
import 'test_calculator/game_emulator.dart';
import 'test_data/data.dart';

void main() {
  test('calculate range for 6 players', () {
    debugPrint("Расчет для 6 игроков");


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

    List<IPlayer> players = sixPlayers();
     emulateGame(players, microMatchResults);
  });



  test('calculate range for 7 players', () {
    debugPrint("Расчет для 7 игроков");

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

    List<IPlayer> players = sevenPlayers();

    emulateGame(players, microMatchResults);
  });

  test('calculate range for 8 players', () {
    debugPrint("Расчет для 8 игроков");

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

    List<IPlayer> players = eightPlayers();

    emulateGame(players, microMatchResults);
  });

  test('calculate range for 9 players', () {
    debugPrint("Расчет для 9 игроков");


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

    List<IPlayer> players = ninePlayers();

    emulateGame(players, microMatchResults);
  });

}
