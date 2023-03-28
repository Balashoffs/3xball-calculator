//за каждый матч персонального рейтинга вкладываются
double _inputPercentOfPersonalRate = 0.02;

final Map<int, int> matchesPoints = {2:3, 1:2, 0:1};

int? fee(int matchesQnt,int range){
  return _inputPercentOfPersonalRate * matchesQnt * range ~/ 10 + 1;
}

Map<int, int> calculatePlayersMicroMatchQnt(List<Map<String, List<int>>> allMatches){
  List<int> all = allMatches.map((mm) => mm.values.toList()).expand((element) => element.expand((element) => element)).toList();
  Map<int, int> qnt = {};
  all.forEach((element) {
    if(qnt.containsKey(element)){
      qnt.update(element, (value) => value++);
    }else{
      qnt.putIfAbsent(element, () => 1);
    }
  });

  return qnt;
}
