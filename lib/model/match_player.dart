import 'package:flutter/cupertino.dart';
import 'package:rf_core/model/i_player.dart';
import 'package:rf_core/model/player_fee.dart';

@visibleForTesting
class MatchPlayer implements IPlayer {
  /// Всего взносов
  static int? matchBallsSum;

  final IUser _user;
  final PlayerFee? _playerFee;

  /// Позиция игрока в турнире
  final int _pos;

  ///Количество потенциальных матчей в турнире у игрока
  final int _matchesQnt;

  ///Сумма очков игрока за сыгранные матчи
  final int _score;

  final int _deltaRange;

  MatchPlayer({
    required IUser user,
    PlayerFee? playerFee,
    int deltaRange = 0,
    required int pos,
    required int matchesQnt,
    required int score,
  })
      : _playerFee = playerFee,
        _user = user,
        _pos = pos,
        _matchesQnt = matchesQnt,
        _deltaRange = deltaRange,
        _score = score;

  @override
  int getMatchesQnt() {
    return _matchesQnt;
  }

  @override
  int getPos() {
    return _pos;
  }

  @override
  int getScore() {
    return _score;
  }

  @override
  IUser getUser() {
    return _user;
  }

  @override
  PlayerFee? getPlayerFee() {
    return _playerFee;
  }

  @override
  int getDeltaRange() {
    return _deltaRange;
  }

  @override
  MatchPlayer copyWith({
    IUser? user,
    PlayerFee? playerFee,
    int? pos,
    int? matchesQnt,
    int? score,
    int? delta,
  }) {
    return MatchPlayer(
      user: user ?? _user,
      pos: pos ?? _pos,
      matchesQnt: matchesQnt ?? _matchesQnt,
      score: score ?? _score,
      playerFee: playerFee ?? _playerFee,);
  }
}
