export 'six_players.dart';
export 'seven_players.dart';
export 'eight_players.dart';
export 'nine_players.dart';

class Players{
 final List<Map<String, List<int>>> _allMatches = [];
 static List<Map<String, List<int>>> allMatches = Players()._allMatches;
}