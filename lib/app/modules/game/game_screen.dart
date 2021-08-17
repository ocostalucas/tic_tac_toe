import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe/app/data/enums/user_type.dart';
import 'package:tic_tac_toe/app/data/players.dart';
import 'package:tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:tic_tac_toe/app/shared/components/buttons/round_button_widget.dart';

import 'components/board_widget.dart';
import 'components/player_widget.dart';
import 'components/winnner_widget.dart';

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundButtonWidget(
                        onTap: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_ios_new,
                            color: Colors.white)),
                    RoundButtonWidget(
                        onTap: () => Navigator.pushNamed(context, '/config',
                            arguments: controller),
                        icon: Icon(Icons.settings, color: Colors.white)),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PlayerWidget(
                          player: Players.getPlayer(UserType.human),
                          playerTurn: controller.game.playerTurn,
                        ),
                        PlayerWidget(
                          player: controller.game.computer,
                          playerTurn: controller.game.playerTurn,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: BoardWidget(
                          controller: controller,
                        ),
                      ),
                      if (controller.game.winner != null)
                        WinnnerWidget(
                          winner: controller.game.winner,
                          controller: controller,
                        )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
