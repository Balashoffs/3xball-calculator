//за каждый матч персонального рейтинга вкладываются
import 'dart:math';



final Map<int, int> matchesPoints = {2: 3, 1: 2, 0: 1};




Map<int, int> calculatePlayersMicroMatchQnt(
    List<Map<String, List<int>>> allMatches) {
  List<int> all = allMatches
      .map((mm) => mm.values.toList())
      .expand((element) => element.expand((element) => element))
      .toList();
  Map<int, int> qnt = {};
  for (var element in all) {
    if (qnt.containsKey(element)) {
      qnt.update(element, (value) => ++value);
    } else {
      qnt.putIfAbsent(element, () => 1);
    }
  }

  return qnt;
}

double roundDouble(double value, int places){
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
