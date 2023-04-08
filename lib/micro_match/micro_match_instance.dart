import '../match/match_utils.dart';
import 'micro_match_triple.dart';

class MicroMatch {
  final MicroMatchTriple homeTriple;
  final MicroMatchTriple awayTriple;
  final int matchPos;


  MicroMatch(this.homeTriple, this.awayTriple, this.matchPos);


  int? calculateWinPoints() {
    int delta = homeTriple.microMatchPoints - awayTriple.microMatchPoints;
    int deltaAbs = delta.abs();
    if (delta == 0) {
      return 1;
    }
    return delta > 0 ? matchesPoints[deltaAbs]! : matchesPoints[deltaAbs]! * -1;
  }

  List<int> getAllPosAtMicroMatch(){
    final List<int> allPlayerAtGame = [];
    allPlayerAtGame.addAll(homeTriple.players.map((e) => e.getPos() as int).toList());
    allPlayerAtGame.addAll(awayTriple.players.map((e) => e.getPos() as int).toList());
    return allPlayerAtGame;
  }


  int? calculateMatchPoints() {
    int delta = homeTriple.microMatchPoints - awayTriple.microMatchPoints;
    return delta.abs();
  }

  void setResult(int homePoints, int awayPoints){
    homeTriple.microMatchPoints = homePoints;
    awayTriple.microMatchPoints = awayPoints;
  }
}