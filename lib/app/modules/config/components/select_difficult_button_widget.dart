import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/data/enums/difficulty_type.dart';
import 'package:tic_tac_toe/app/data/enums/user_type.dart';
import 'package:tic_tac_toe/app/data/players.dart';
import 'package:tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

class SelectDifficultButtonWidget extends StatelessWidget {
  final DifficultyType difficulty;
  final GameController gameController;

  SelectDifficultButtonWidget(
      {Key? key, required this.difficulty, required this.gameController})
      : super(key: key);

  void onTap(BuildContext context) {
    gameController.changeDifficulty(difficulty: difficulty);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Material(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: InkWell(
              onTap: () => onTap(context),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Container(
                width: double.infinity,
                height: 70,
                child: Center(
                  child: Text(
                      difficulty == DifficultyType.hard
                          ? 'Difícil'
                          : difficulty == DifficultyType.normal
                              ? 'Normal'
                              : 'Fácil',
                      style: AppTypography.heading),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(context),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                Players.getPlayer(difficulty == DifficultyType.normal
                        ? UserType.normalComputer
                        : difficulty == DifficultyType.hard
                            ? UserType.hardComputer
                            : UserType.easyComputer)
                    .logo,
              ),
            ),
          )
        ],
      ),
    );
  }
}
