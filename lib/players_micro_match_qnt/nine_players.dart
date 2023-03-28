/*
Осталось подставить 8 и 9. В приоритете пары 1,2 1,3 и 2,3. Остальные могут повторяться.
  (1,4,7)  (2,5,6) (3,8,9) (2,4,6) (1,3,5) (7,8,9) (1,2,3) (4,6,8) (5,7,9) (1,2,4) (3,5,9) (6,7,8) (1,3,9) (2,4,8) (5,6,7)
	2 3      1 3     1 2     1 3     2 4     1 2     4 5     1 2     1 3     3 5     1 2     1 2     2 4     1 3     1 2
	6 5      7 4     5 4     7 5     7 6     4 3     7 6     3 5     2 4     7 6     6 4     4 3     5 6     5 6     4 3
  8 9      8 9     6 7     9 8     9 8     5 6     8 9     7 9     8 6     9 8     7 8     9 5     8 7     9 7     8 9
Повторов нет.
*/

class NinePlayers {
  static final Map<String, List<int>> _match1 = {
    "home": [2, 6, 8],
    "away": [3, 5, 9]
  };
  static final Map<String, List<int>> _match2 = {
    "home": [1, 7, 8],
    "away": [3, 4, 9]
  };
  static final Map<String, List<int>> _match3 = {
    "home": [1, 7, 9],
    "away": [3, 5, 8]
  };
  static final Map<String, List<int>> _match4 = {
    "home": [2, 7, 9],
    "away": [4, 6, 8]
  };

  static final Map<String, List<int>> _match5 = {
    "home": [2, 7, 9],
    "away": [4, 6, 8]
  };
  static final Map<String, List<int>> _match6 = {
    "home": [1, 4, 5],
    "away": [2, 3, 6]
  };
  static final Map<String, List<int>> _match7 = {
    "home": [4, 7, 8],
    "away": [5, 6, 9]
  };
  static final Map<String, List<int>> _match8 = {
    "home": [1, 3, 7],
    "away": [2, 5, 9]
  };
  static final Map<String, List<int>> _match9 = {
    "home": [1, 2, 8],
    "away": [3, 4, 6]
  };
  static final Map<String, List<int>> _match10 = {
    "home": [3, 7, 9],
    "away": [5, 6, 8]
  };
  static final Map<String, List<int>> _match11 = {
    "home": [1, 6, 7],
    "away": [2, 4, 8]
  };
  static final Map<String, List<int>> _match12 = {
    "home": [1, 4, 9],
    "away": [2, 3, 5]
  };
  static final Map<String, List<int>> _match13 = {
    "home": [2, 5, 8],
    "away": [4, 6, 7]
  };
  static final Map<String, List<int>> _match14 = {
    "home": [1, 5, 9],
    "away": [3, 6, 7]
  };
  static final Map<String, List<int>> _match15 = {
    "home": [1, 4, 8],
    "away": [2, 3, 9]
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
    _match13,
    _match14,
    _match15,
  ];
}
