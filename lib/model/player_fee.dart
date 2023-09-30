import 'package:flutter/material.dart';

class PlayerFee {
  final String _id;

  final int _additionalFee;

  ///Количество очков, которое внес игрок в начале турнира
  final int _startFee;

  ///Количество очков, которое игрок получил в конце турнира
  final int _endFee;

  ///Дробная часть от [endFee]
  final double _endFraction;

  final double _matchBallsAsPercent;

  PlayerFee({
    required String id,
    int additionalFee = 0,
    int startFee = 0,
    int endFee = 0,
    double endFraction = 0,
    double matchBallsAsPercent = 0.0,
  })  : _id = id,
        _additionalFee = additionalFee,
        _startFee = startFee,
        _endFee = endFee,
        _endFraction = endFraction,
        _matchBallsAsPercent = matchBallsAsPercent;

  PlayerFee copyWith({
    String? id,
    int? additionalFee,
    int? startFee,
    int? endFee,
    double? endFraction,
    double? matchBallsAsPercent,
  }) {
    return PlayerFee(
      id: id ?? _id,
      additionalFee: additionalFee ?? _additionalFee,
      startFee: startFee ?? _startFee,
      endFee: endFee ?? _endFee,
      endFraction: endFraction ?? _endFraction,
      matchBallsAsPercent: matchBallsAsPercent ?? _matchBallsAsPercent,
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerFee &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _additionalFee == other._additionalFee &&
          _startFee == other._startFee &&
          _endFee == other._endFee &&
          _endFraction == other._endFraction &&
          _matchBallsAsPercent == other._matchBallsAsPercent;

  @override
  int get hashCode =>
      _id.hashCode ^
      _additionalFee.hashCode ^
      _startFee.hashCode ^
      _endFee.hashCode ^
      _endFraction.hashCode ^
      _matchBallsAsPercent.hashCode;

  @override
  int getAdditionalFee() {
    return _additionalFee;
  }

  @override
  int getEndFee() {
    return _endFee;
  }

  @override
  double getEndFraction() {
    return _endFraction;
  }

  @override
  String getId() {
    return _id;
  }

  @override
  double getMatchBallsAsPercent() {
    return _matchBallsAsPercent;
  }

  @override
  int getStartFee() {
    return _startFee;
  }
}
