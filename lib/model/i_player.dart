import 'player_fee.dart';

abstract class IUser{
  String getId();
  String getFirstName();
  String getLastName();
  int getRange();

  IUser copyWith({
    String? id,
    String? lastName,
    String? firstName,
    int? rate,
  });
}

abstract class IPlayer{
  IUser getUser();
  PlayerFee? getPlayerFee();
  int getPos();
  int getMatchesQnt();
  int getScore();
  int getDeltaRange();

  IPlayer copyWith({
    IUser? user,
    PlayerFee? playerFee,
    int? pos,
    int? matchesQnt,
    int? score,
    int? delta,
  });
}