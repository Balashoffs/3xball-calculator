import 'package:rf_core/i_player.dart';

class MatchPlayer implements IPlayer {
  /// Всего взносов
  static int? matchBallsSum;

  /// Позиция игрока в турнире
  final int _pos;

  final String _id;

  /// Фамилия игрока
  final String _lastName;

  /// Имя игрока
  final String _firstName;

  /// Общий рейтинг игрока в приложении
  final int _range;

  ///Количество потенциальных матчей в турнире у игрока
  final int _matchesQnt;

  ///Сумма очков игрока за сыгранные матчи
  int _score;

  int additionalFee = 0;

  ///Количество очков, которое внес игрок в начале турнира
  late final int? startFee;

  ///Количество очков, которое игрок получил в конце турнира
  late final int? endFee;

  ///Дробная часть от [endFee]
  late final double? endFraction;

  late final double? matchBallsAsPercent;

  MatchPlayer({id, pos, lastName, firstName, range, matchesQnt = 0, score})
      : _pos = pos,
        _id = id,
        _lastName = lastName,
        _firstName = firstName,
        _score = score,
        _matchesQnt = matchesQnt,
        _range = range;

  @override
  String getFirstName() => _firstName;

  @override
  String getLastName() => _lastName;

  @override
  int getRange() => _range;

  int getNewRange() => _range - startFee! + endFee! + additionalFee;

  @override
  String getId() {
    return _id;
  }

  @override
  int getPos() {
    return _pos;
  }

  @override
  int getMatchesQnt() {
    return _matchesQnt;
  }

  @override
  int getScore() {
    return _score;
  }

  @override
  void setScore(int score) {
    _score += score;
  }

  MatchPlayer copyWith({
    int? pos,
    String? id,
    String? lastName,
    String? firstName,
    int? range,
    int? matchesQnt,
    int? score,
  }) {
    return MatchPlayer(
      pos: pos ?? _pos,
      id: id ?? _id,
      lastName: lastName ?? _lastName,
      firstName: firstName ?? _firstName,
      range: range ?? _range,
      matchesQnt: matchesQnt ?? _matchesQnt,
      score: score ?? _score,
    );
  }

  @override
  int get hashCode =>
      _pos.hashCode ^
      _lastName.hashCode ^
      _firstName.hashCode ^
      _range.hashCode ^
      _id.hashCode ^
      _score.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchPlayer &&
          runtimeType == other.runtimeType &&
          _pos == other._pos &&
          _lastName == other._lastName &&
          _firstName == other._firstName &&
          _range == other._range &&
          _id == other._id &&
          _score == other._score;

  @override
  String toString() {
    return 'MatchPlayer{_pos: $_pos, _id: $_id, _lastName: $_lastName, _firstName: $_firstName, _range: $_range, _matchesQnt: $_matchesQnt, _score: $_score}';
  }
}
