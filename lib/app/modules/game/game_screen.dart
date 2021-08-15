import 'package:flutter/material.dart';
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerWidget(),
                    PlayerWidget(),
                  ],
                ),
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
