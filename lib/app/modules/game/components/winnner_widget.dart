import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/data/enums/player_type.dart';
import 'package:tic_tac_toe/app/data/enums/user_type.dart';
import 'package:tic_tac_toe/app/data/players.dart';
import 'package:tic_tac_toe/app/shared/components/buttons/button_widget.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_images.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

import '../game_controller.dart';

class WinnnerWidget extends StatelessWidget {
  final PlayerType? winner;
  final GameController controller;
  WinnnerWidget({Key? key, required this.winner, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.border),
        color: AppColors.primary.withOpacity(.8),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(winner == PlayerType.human
                    ? Players.getPlayer(UserType.human).logo
                    : winner == PlayerType.computer
                        ? controller.game.computer.logo
                        : AppImages.draw),
              ),
              SizedBox(width: 10),
              Text(
                  winner == PlayerType.human
                      ? 'Você venceu!'
                      : winner == PlayerType.computer
                          ? 'Você perdeu!'
                          : 'Empate!',
                  style: AppTypography.heading)
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ButtonWidget(onTap: controller.newGame, label: 'Novo jogo'),
          )
        ],
      ),
    );
  }
}
