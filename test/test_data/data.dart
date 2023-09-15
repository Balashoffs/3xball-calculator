import 'dart:convert';

import 'package:rf_core/micro_match/micro_match.dart';

import '../test_models/match_player.dart';

String jsonWithSixPlayers =
    '''[{"id":"edb8a4c1-8138-4885-a753-7ae1b2e7c890","pos":1,"lastName":"Seally","firstName":"Elton","matchesQnt":6,"score":0,"rate":2000},
{"id":"23ddd1f7-21a8-43c1-bfd1-554b72acee93","pos":2,"lastName":"Donne","firstName":"Efren","matchesQnt":6,"score":0,"rate":2000},
{"id":"fdca3315-ff6a-4d9d-bf7f-4586817354fa","pos":3,"lastName":"Stovold","firstName":"Bartie","matchesQnt":6,"score":0,"rate":2000},
{"id":"0c774b55-6966-4c7e-aa2c-21d41e969cb2","pos":4,"lastName":"Pendergast","firstName":"Kipper","matchesQnt":6,"score":0,"rate":2000},
{"id":"b56456ba-118e-4ca7-bf76-0d15771f577d","pos":5,"lastName":"McFadin","firstName":"Hoebart","matchesQnt":6,"score":0,"rate":2000},
{"id":"9bf7cb54-30dd-48b6-ade8-85df45d06dbb","pos":6,"lastName":"Dowdeswell","firstName":"Natal","matchesQnt":6,"score":0,"rate":2000}]''';

List<IPlayer> sixPlayers() {
  List<dynamic> keyValues =
      jsonDecode(jsonWithSixPlayers) as List<dynamic>;

  return parseMap(keyValues);
}

List<IPlayer> parseMap(List<dynamic> keyValues) {
  return keyValues.map((e) {
    String id = e['id'];
    String lastName = e['lastName'];
    String firstName = e['firstName'];
    int pos = e['pos'];
    int rate = e['rate'];
    int matchesQnt = e['matchesQnt'];
    int score = e['score'];
    return MatchPlayer.create(
      id: id,
      pos: pos,
      lastName: lastName,
      firstName: firstName,
      rate: rate,
      matchesQnt: matchesQnt,
      score: score,
    );
  }).toList();
}

String jsonWithSevenPlayers =
    '''[{"id":"f305f581-11e0-4705-a037-bb3dd9fdf7a9","pos":1,"lastName":"O'Halligan","firstName":"Darius","matchesQnt":7,"score":0,"rate":2000},
{"id":"6e277c4f-77fc-447c-8e75-ff19ef792207","pos":2,"lastName":"Chatel","firstName":"Phillip","matchesQnt":7,"score":0,"rate":2000},
{"id":"ed4d4030-155b-4b8f-905a-ef8c6fa6fd7f","pos":3,"lastName":"Hessel","firstName":"Mike","matchesQnt":7,"score":0,"rate":2000},
{"id":"7c418558-f0b6-44e8-b6ca-17756221864f","pos":4,"lastName":"Cranmor","firstName":"Filip","matchesQnt":7,"score":0,"rate":2000},
{"id":"b8ea4887-cfa1-4bdd-8a4f-b7c4df54714e","pos":5,"lastName":"Camosso","firstName":"Chip","matchesQnt":7,"score":0,"rate":2000},
{"id":"aaa32fa5-9220-4f56-b0aa-dc2960662d58","pos":6,"lastName":"Doogue","firstName":"Gordie","matchesQnt":7,"score":0,"rate":2000},
{"id":"630adf97-dede-4db3-8f79-0ca4c072157a","pos":7,"lastName":"Dunge","firstName":"Jarvis","matchesQnt":7,"score":0,"rate":2000}]''';

List<IPlayer> sevenPlayers() {
  List<dynamic> keyValues =
      jsonDecode(jsonWithSevenPlayers) as  List<dynamic>;

  return parseMap(keyValues);
}

String jsonWithEightPlayers = '''
[{"id":"7856e98f-42c8-466e-bba8-b9c3a18ffd7b","pos":1,"lastName":"Comiam","firstName":"Gabi","matchesQnt":8,"score":0,"rate":2000},
{"id":"1c118592-e904-4d2f-8f99-180b7d13c17b","pos":2,"lastName":"Bedson","firstName":"Kirby","matchesQnt":8,"score":0,"rate":2000},
{"id":"2948ff51-d941-458f-8302-7105d544542b","pos":3,"lastName":"Durand","firstName":"Ford","matchesQnt":8,"score":0,"rate":2000},
{"id":"7336ab5f-a504-49cc-abb4-7cbbf58a6678","pos":4,"lastName":"Dall","firstName":"Dar","matchesQnt":8,"score":0,"rate":2000},
{"id":"412f746e-674b-492c-b54b-b8afe6ac6936","pos":5,"lastName":"Sheron","firstName":"Duky","matchesQnt":8,"score":0,"rate":2000},
{"id":"22634c29-3b3b-4155-8182-b464298eab9c","pos":6,"lastName":"Espina","firstName":"Sam","matchesQnt":8,"score":0,"rate":2000},
{"id":"56b6c8c2-d473-40f3-b199-cecc6dcdebfb","pos":7,"lastName":"Gadson","firstName":"Biron","matchesQnt":8,"score":0,"rate":2000},
{"id":"a5d28dd5-fe3c-410f-9b06-0d76ebc0d9e1","pos":8,"lastName":"Synan","firstName":"Barn","matchesQnt":8,"score":0,"rate":2000}]
''';

List<IPlayer> eightPlayers() {
  List<dynamic> keyValues =
  jsonDecode(jsonWithEightPlayers) as List<dynamic>;

  return parseMap(keyValues);
}

String jsonWithNinePlayers = '''
[{"id":"526e273d-403b-4042-aae9-a32ac03c7413","pos":1,"lastName":"Alkin","firstName":"Den","matchesQnt":9,"score":0,"rate":2000},
{"id":"fedcc5f1-8972-4956-8f5b-f84b82fdfa46","pos":2,"lastName":"Chaffyn","firstName":"Ingram","matchesQnt":9,"score":0,"rate":2000},
{"id":"d874e6e7-593a-4192-ac5f-4bf6efd34b81","pos":3,"lastName":"Sone","firstName":"Lion","matchesQnt":9,"score":0,"rate":2000},
{"id":"68d51b9b-ff7d-4294-bb6d-480858a3b7d8","pos":4,"lastName":"Taffie","firstName":"Humberto","matchesQnt":9,"score":0,"rate":2000},
{"id":"06a00846-9a0a-4cc2-a5d4-1e9631cf0e66","pos":5,"lastName":"Bagnal","firstName":"Samuel","matchesQnt":9,"score":0,"rate":2000},
{"id":"428d3faa-6beb-4cf0-bb1e-740b4ac3f5b2","pos":6,"lastName":"Blay","firstName":"Tommie","matchesQnt":9,"score":0,"rate":2000},
{"id":"e4eb5e15-2846-408c-8583-07b615e71def","pos":7,"lastName":"Beynkn","firstName":"Stacy","matchesQnt":9,"score":0,"rate":2000},
{"id":"918413d7-8218-44a6-846a-2ebead8ccd31","pos":8,"lastName":"Vairow","firstName":"Marvin","matchesQnt":9,"score":0,"rate":2000},
{"id":"fed0a189-4bce-4591-a71f-8cb514287a2e","pos":9,"lastName":"Leishman","firstName":"Warden","matchesQnt":9,"score":0,"rate":2000}]
''';

List<IPlayer> ninePlayers() {
  List<dynamic> keyValues =
  jsonDecode(jsonWithNinePlayers) as List<dynamic>;

  return parseMap(keyValues);
}