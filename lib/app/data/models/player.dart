import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:tic_tac_toe/app/data/enums/player_type.dart';
import 'package:tic_tac_toe/app/data/ia/ia_interface.dart';

class Player {
  final String name;
  final String seletor;
  final Color selectorColor;
  final String logo;
  final PlayerType type;
  final IaInterface? ia;
  Player({
    required this.name,
    required this.seletor,
    required this.selectorColor,
    required this.logo,
    required this.type,
    this.ia,
  });

  Player copyWith({
    String? name,
    String? seletor,
    Color? selectorColor,
    String? logo,
    PlayerType? type,
    IaInterface? ia,
  }) {
    return Player(
      name: name ?? this.name,
      seletor: seletor ?? this.seletor,
      selectorColor: selectorColor ?? this.selectorColor,
      logo: logo ?? this.logo,
      type: type ?? this.type,
      ia: ia ?? this.ia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'seletor': seletor,
      'selectorColor': selectorColor.value,
      'logo': logo,
      'type': type == PlayerType.human
          ? 0
          : type == PlayerType.computer
              ? 1
              : 2,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'],
      seletor: map['seletor'],
      selectorColor: Color(map['selectorColor']),
      logo: map['logo'],
      type: map['type'] == 0
          ? PlayerType.human
          : map['type'] == 1
              ? PlayerType.computer
              : PlayerType.none,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Player(name: $name, seletor: $seletor, selectorColor: $selectorColor, logo: $logo, type: $type, ia: $ia)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Player &&
        other.name == name &&
        other.seletor == seletor &&
        other.selectorColor == selectorColor &&
        other.logo == logo &&
        other.type == type &&
        other.ia == ia;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        seletor.hashCode ^
        selectorColor.hashCode ^
        logo.hashCode ^
        type.hashCode ^
        ia.hashCode;
  }
}
