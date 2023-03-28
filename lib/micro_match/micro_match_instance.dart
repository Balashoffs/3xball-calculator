
import 'match_utils.dart';
import 'micro_match_triple.dart';

class MicroMatch {
  final MicroMatchTriple homeTriple;
  final MicroMatchTriple awayTriple;

  MicroMatch(this.homeTriple, this.awayTriple);

  int? calculateWinPoints() {
    int delta = homeTriple.microMatchPoints - awayTriple.microMatchPoints;
    int deltaAbs = delta.abs();
    if (delta == 0) {
      return 1;
    }
    return delta > 0 ? matchesPoints[deltaAbs]! : matchesPoints[deltaAbs]! * -1;
  }

  int? calculateMatchPoints() {
    int delta = homeTriple.microMatchPoints - awayTriple.microMatchPoints;
    return delta.abs();
  }
}