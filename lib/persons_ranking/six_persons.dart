/*
	1 4      1 2     1 2     1 2     1 3     2 1     2 1     2 1      3 1     3 1
	2 5      3 5     4 3     5 3     6 4     3 5     4 3     5 3      4 2     5 2
  3 6      4 6     5 6     6 4     2 5     4 6     5 6     6 4      5 6     6 4
тройка 1,4,6 и 3,4,7 повторились.
*/

class SixPersons {
  static final Map<String, List<int>> _match1 = {
    "home": [1, 2, 5],
    "away": [3, 4, 6]
  };
  static final Map<String, List<int>> _match2 = {
    "home": [1, 3, 7],
    "away": [2, 4, 5]
  };
  static final Map<String, List<int>> _match3 = {
    "home": [1, 4, 7],
    "away": [2, 3, 6]
  };
  static final Map<String, List<int>> _match4 = {
    "home": [1, 2, 7],
    "away": [4, 5, 6]
  };
  static final Map<String, List<int>> _match5 = {
    "home": [1, 3, 6],
    "away": [2, 5, 7]
  };
  static final Map<String, List<int>> _match6 = {
    "home": [1, 4, 6],
    "away": [3, 5, 7]
  };
  static final Map<String, List<int>> _match7 = {
    "home": [2, 5, 6],
    "away": [3, 4, 7]
  };
  static final Map<String, List<int>> _match8 = {
    "home": [1, 5, 7],
    "away": [2, 4, 6]
  };
  static final Map<String, List<int>> _match9 = {
    "home": [1, 5, 6],
    "away": [2, 3, 7]
  };
  static final Map<String, List<int>> _match10 = {
    "home": [1, 2, 6],
    "away": [3, 4, 7]
  };
  static final Map<String, List<int>> _match11 = {
    "home": [1, 3, 5],
    "away": [2, 4, 7]
  };
  static final Map<String, List<int>> _match12 = {
    "home": [1, 4, 6],
    "away": [2, 3, 5]
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