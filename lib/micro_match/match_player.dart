import 'package:rf_core/micro_match/i_player.dart';

import 'match_utils.dart';


class MatchPlayer implements IPlayer {
  final int? _pos;
  final String? _fullName;
  final int? _range;
  final int? _matchesQnt;
  final int? _partOfRange;
  double partOfRangeAtPercent = 0.0;
  int points = 0;

  MatchPlayer({pos, fullName, range, matchesQnt})
      : _pos = pos,
        _fullName = fullName,
        _range = range,
        _matchesQnt = matchesQnt ?? 0,
        _partOfRange = matchesQnt == null ? 0 :fee(matchesQnt, range);

  MatchPlayer copyWith(
          {int? pos, String? fullName, int? range, int? matchesQnt}) =>
      MatchPlayer(
          pos: pos ?? _pos,
          fullName: fullName ?? _fullName,
          range: range ?? _range,
          matchesQnt: matchesQnt ?? _matchesQnt);

  int? get balls => _partOfRange;

  @override
  String? getFullName() => _fullName;

  @override
  int? getRange() => _range;

  int? getMatchQnt() => _matchesQnt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchPlayer &&
          runtimeType == other.runtimeType &&
          _fullName == other._fullName &&
          _range == other._range &&
          _matchesQnt == other._matchesQnt &&
          _partOfRange == other._partOfRange;

  @override
  int get hashCode =>
      _fullName.hashCode ^
      _range.hashCode ^
      _matchesQnt.hashCode ^
      _partOfRange.hashCode;

  @override
  int? getPos() {
    return _pos;
  }

  @override
  String toString() {
    return 'MatchPlayer{$_pos, $_fullName, $_range,  $_matchesQnt, $_partOfRange, $partOfRangeAtPercent, $points}';
  }

  String toPlayer() {
    return 'MatchPlayer{$_pos, $_fullName, $_range}';
  }


}
