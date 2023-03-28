import 'package:rf_core/calculator/calculator.dart';
import 'package:rf_core/micro_match/micro_match.dart';

class RangeCalculator{
  final MicroMatchCalculator? _calculator;

  RangeCalculator({required List<IPlayer> players}):
        _calculator = create(players: players);

  MicroMatch? getNextMicroMatchPair(){
    return _calculator?.getNextMicroMatchPair();
  }

  void updatePlayerPointAfterMatch(MicroMatch microMatch){
    _calculator?.updatePlayerPointAfterMatch(microMatch);
  }

  List<IPlayer>? calculateResults(){
    return _calculator?.calculateResults();
  }
}