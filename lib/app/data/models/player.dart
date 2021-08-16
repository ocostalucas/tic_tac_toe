import 'package:flutter/cupertino.dart';

import 'package:tic_tac_toe/app/data/enums/player_type.dart';

class Player {
  String name;
  String seletor;
  Color selectorColor;
  String logo;
  PlayerType type;

  Player({
    required this.name,
    required this.seletor,
    required this.selectorColor,
    required this.logo,
    required this.type,
  });
}
