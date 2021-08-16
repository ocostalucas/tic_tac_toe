import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/data/enums/player_type.dart';
import 'package:tic_tac_toe/app/data/models/player.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_lottie_files.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

class PlayerWidget extends StatelessWidget {
  final Player player;
  final PlayerType playerTurn;

  PlayerWidget({
    Key? key,
    required this.player,
    required this.playerTurn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        playerTurn == player.type
            ? AppLottie(
                lottie: AppLottieFiles.arrowDown,
                repeat: true,
                size: Size(60, 60),
              )
            : SizedBox(width: 60, height: 60),
        Container(
          width: 115,
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: playerTurn == player.type
                ? Border.all(width: 1, color: AppColors.secondary)
                : null,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(player.logo),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(player.name, style: AppTypography.body),
              ),
              Text(
                player.seletor,
                style:
                    AppTypography.heading.copyWith(color: player.selectorColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
