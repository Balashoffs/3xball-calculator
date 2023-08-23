import 'package:rf_core/i_player.dart';

class MatchPlayer implements IPlayer {
  static int? matchBallsSum;
  final int? _pos;
  final String? _lastName;
  final String? _firstName;
  final int? _range;
  late final int? startFee;
  late final int? endFee;
  late final double? endFraction;
  late final double? matchBallsAsPercent;
  int? additionalFee = 0;

  MatchPlayer({pos, lastName, firstName, range, matchesQnt})
      : _pos = pos,
        _lastName = lastName,
        _firstName = firstName,
        _range = range;

  MatchPlayer copyWith({
    int? pos,
    String? lastName,
    String? firstName,
    int? range,
  }) {
    return MatchPlayer(
      pos: pos ?? _pos,
      lastName: lastName ?? _lastName,
      firstName: firstName ?? _firstName,
      range: range ?? _range,
    );
  }


  @override
  String? getFirstName() => _firstName;

  @override
  String? getLastName() => _lastName;

  @override
  int? getRange() => _range;

  int? getNewRange() => _range! - startFee! + endFee! + additionalFee!;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchPlayer &&
          runtimeType == other.runtimeType &&
          _pos == other._pos &&
          _lastName == other._lastName &&
          _firstName == other._firstName &&
          _range == other._range;

  @override
  int get hashCode =>
      _pos.hashCode ^
      _lastName.hashCode ^
      _firstName.hashCode ^
      _range.hashCode;

  @override
  int? getPos() {
    return _pos;
  }

  @override
  String toString() {
    return 'MatchPlayer{$_pos, $_lastName, $_range}';
  }
}

