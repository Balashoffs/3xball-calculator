import 'package:flutter/material.dart';

@visibleForTesting
class PlayerFee {
  final String id;

  final int additionalFee;

  ///Количество очков, которое внес игрок в начале турнира
  final int startFee;

  ///Количество очков, которое игрок получил в конце турнира
  final int endFee;

  ///Дробная часть от [endFee]
  final double endFraction;

  final double matchBallsAsPercent;

  PlayerFee({
    required this.id,
    this.additionalFee = 0,
    this.startFee = 0,
    this.endFee = 0,
    this.endFraction = 0,
    this.matchBallsAsPercent = 0.0,
  });

  PlayerFee copyWith({
    String? id,
    int? additionalFee,
    int? startFee,
    int? endFee,
    double? endFraction,
    double? matchBallsAsPercent,
  }) {
    return PlayerFee(
      id: id ?? this.id,
      additionalFee: additionalFee ?? this.additionalFee,
      startFee: startFee ?? this.startFee,
      endFee: endFee ?? this.endFee,
      endFraction: endFraction ?? this.endFraction,
      matchBallsAsPercent: matchBallsAsPercent ?? this.matchBallsAsPercent,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PlayerFee && runtimeType == other.runtimeType &&
              endFee == other.endFee;

  @override
  int get hashCode => endFee.hashCode;


}
