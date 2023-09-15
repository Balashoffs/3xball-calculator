import 'package:rf_core/model/i_player.dart';
import 'package:rf_core/model/player_fee.dart';

import 'user.dart';

class MatchPlayer implements IPlayer {
  /// Всего взносов

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
  })  : _playerFee = playerFee,
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
  IPlayer copyWith({
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
      playerFee: playerFee ?? _playerFee,
      deltaRange: delta ?? _deltaRange,
    );
  }

  static MatchPlayer create({
    required String id,
    required int pos,
    required String lastName,
    required String firstName,
    required int rate,
    required int matchesQnt,
    required int score,
  }) {
    IUser user =
        User(id: id, firstName: firstName, lastName: lastName, rate: rate);
    return MatchPlayer(
      user: user,
      pos: pos,
      matchesQnt: matchesQnt,
      score: score,
    );
  }

  @override
  String toString() {
    return 'MatchPlayer{_user: $_user, _playerFee: $_playerFee, _pos: $_pos, _matchesQnt: $_matchesQnt, _score: $_score, _deltaRange: $_deltaRange}';
  }
}
