/*
  Осталось подставить 5 6 и 7. В приоритете пары 1,2 1,3 и 2,3. Остальные могут повторяться.
  (1,5)    (2,6)   (4,8)   (3,7)   (1,6)   (2,5)   (3,4)   (7,8)   (1,3)   (2,4)   (5,7)   (6,8)
  2 3      1 3     1 2     1 4     2 3     1 3     1 2     1 2     2 4     1 3     1 2     1 2
  6 4      4 5     5 3     2 5     5 4     4 6     5 6     3 4     5 6     6 5     3 4     4 3
  8 7      7 8     7 6     8 6     7 8     8 7     8 7     6 5     8 7     8 7     8 6     5 7
  Повторов нет.
*/

class EightPersons {
  static final Map<String, List<int>> _match1 = {
    "home": [2, 6, 8],
    "away": [3, 4, 7]
  };
  static final Map<String, List<int>> _match2 = {
    "home": [1, 4, 7],
    "away": [3, 5, 8]
  };
  static final Map<String, List<int>> _match3 = {
    "home": [1, 5, 7],
    "away": [2, 3, 6]
  };
  static final Map<String, List<int>> _match4 = {
    "home": [1, 2, 8],
    "away": [4, 5, 6]
  };
  static final Map<String, List<int>> _match5 = {
    "home": [2, 5, 7],
    "away": [3, 4, 8]
  };
  static final Map<String, List<int>> _match6 = {
    "home": [1, 4, 8],
    "away": [3, 6, 7]
  };
  static final Map<String, List<int>> _match7 = {
    "home": [1, 5, 8],
    "away": [2, 6, 7]
  };
  static final Map<String, List<int>> _match8 = {
    "home": [1, 3, 6],
    "away": [2, 4, 5]
  };
  static final Map<String, List<int>> _match9 = {
    "home": [2, 5, 8],
    "away": [4, 6, 7]
  };
  static final Map<String, List<int>> _match10 = {
    "home": [1, 6, 8],
    "away": [3, 5, 7]
  };
  static final Map<String, List<int>> _match11 = {
    "home": [1, 3, 8],
    "away": [2, 4, 6]
  };
  static final Map<String, List<int>> _match12 = {
    "home": [1, 4, 5],
    "away": [2, 3, 7]
  };
  static final List<Map<String, List<int>>> allMatches = [
    _match1,
    _match2,
    _match3,
    _match4,
    _match5,
    _match6,
    _match7,
    _match8,
    _match9,
    _match10,
    _match11,
    _match12,
  ];
}
