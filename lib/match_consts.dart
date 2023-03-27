//за каждый матч персонального рейтинга вкладываются
double _inputPercentOfPersonalRate = 0.02;

final Map<int, int> matchesPoints = {2:3, 1:2, 0:1};

int? fee(int matchesQnt,int range){
  return _inputPercentOfPersonalRate * matchesQnt * range ~/ 10 + 1;
}
