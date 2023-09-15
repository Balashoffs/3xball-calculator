import 'package:flutter/material.dart';
import 'package:rf_core/model/i_player.dart';

class User implements IUser {
  final String _id;
  final String _lastName;
  final String _firstName;
  final int _rate;

  User({
    required String id,
    required String lastName,
    required String firstName,
    required int rate,
  })  : _id = id,
        _lastName = lastName,
        _firstName = firstName,
        _rate = rate;

  @override
  String getId() {
    return _id;
  }

  @override
  String getFirstName() {
    return _firstName;
  }

  @override
  String getLastName() {
    return _lastName;
  }

  @override
  int getRange() {
    return _rate;
  }

  @override
  User copyWith({
    String? id,
    String? lastName,
    String? firstName,
    int? rate,
  }) {
    return User(
      id: id ?? _id,
      lastName: lastName ?? _lastName,
      firstName: firstName ?? _firstName,
      rate: rate ?? _rate,
    );
  }
}
