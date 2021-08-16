import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe/app/data/enums/user_type.dart';
import 'package:tic_tac_toe/app/data/players.dart';
import 'package:tic_tac_toe/app/modules/game/game_controller.dart';

import 'components/board_widget.dart';
import 'components/player_widget.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PlayerWidget(
                          player: Players.getPlayer(UserType.human),
                          playerTurn: controller.playerTurn,
                        ),
                        PlayerWidget(
                          player: Players.getPlayer(UserType.easyComputer),
                          playerTurn: controller.playerTurn,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BoardWidget(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
