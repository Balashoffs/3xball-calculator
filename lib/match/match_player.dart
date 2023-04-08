import 'package:rf_core/i_player.dart';

class MatchPlayer implements IPlayer {
  final int? _pos;
  final String? _fullName;
  final int? _range;


  MatchPlayer({pos, fullName, range, matchesQnt})
      : _pos = pos,
        _fullName = fullName,
        _range = range;

  MatchPlayer copyWith(
          {int? pos, String? fullName, int? range}) {
   return MatchPlayer(
          pos: pos ?? _pos,
          fullName: fullName ?? _fullName,
          range: range ?? _range);
 }


  @override
  String? getFullName() => _fullName;

  @override
  int? getRange() => _range;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchPlayer &&
          runtimeType == other.runtimeType &&
          _fullName == other._fullName &&
          _range == other._range;

  @override
  int get hashCode =>
      _fullName.hashCode ^
      _range.hashCode;

  @override
  int? getPos() {
    return _pos;
  }

  @override
  String toString() {
    return 'MatchPlayer{$_pos, $_fullName, $_range}';
  }
}
