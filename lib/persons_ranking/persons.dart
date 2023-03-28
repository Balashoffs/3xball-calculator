export 'six_persons.dart';
export 'seven_persons.dart';
export 'eight_persons.dart';
export 'nine_persons.dart';

class Persons{
 final List<Map<String, List<int>>> _allMatches = [];
 static List<Map<String, List<int>>> allMatches = Persons()._allMatches;
}