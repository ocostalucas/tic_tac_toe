import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/data/enums/player_type.dart';

class GameController {
  final boardNotifier = ValueNotifier<List<PlayerType>>(<PlayerType>[
    PlayerType.computer,
    PlayerType.none,
    PlayerType.none,
    PlayerType.player,
    PlayerType.none,
    PlayerType.player,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none
  ]);

  List<PlayerType> get board => boardNotifier.value;
}
