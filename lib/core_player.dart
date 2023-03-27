import 'package:rf_core/i_player.dart';
import 'match_consts.dart';

class CorePlayer implements IPlayer {
  final String? _fullName;
  final int? _range;
  final int? _matchesQnt;
  final int? _balls;
  double ballsPercent = 0.0;
  int points = 0;

  CorePlayer(
      {required fullName,
      required range,
      required matchesQnt})
      : _fullName = fullName,
        _range = range,
        _matchesQnt = matchesQnt,
        _balls = fee(matchesQnt, range);

  int? get balls => _balls;

  @override
  String? getFullName() => _fullName;

  @override
  int? getRange() => _range;

  int? getMatchQnt() => _matchesQnt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorePlayer &&
          runtimeType == other.runtimeType &&
          _fullName == other._fullName &&
          _range == other._range &&
          _matchesQnt == other._matchesQnt &&
          _balls == other._balls;

  @override
  int get hashCode =>
      _fullName.hashCode ^
      _range.hashCode ^
      _matchesQnt.hashCode ^
      _balls.hashCode;
}
