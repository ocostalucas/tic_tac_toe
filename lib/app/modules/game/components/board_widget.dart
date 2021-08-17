import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe/app/data/enums/player_type.dart';
import 'package:tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

class BoardWidget extends StatelessWidget {
  final GameController controller;
  BoardWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(15),
      child: AspectRatio(
        aspectRatio: 1,
        child: Observer(
          builder: (_) {
            return GridView.builder(
              itemCount: controller.game.board.length,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) => Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: AppColors.primary,
                child: InkWell(
                  onTap: controller.game.board[index] == PlayerType.none &&
                          controller.game.playerTurn == PlayerType.human &&
                          controller.game.winner == null
                      ? () => controller.move(position: index)
                      : null,
                  splashColor: AppColors.border.withOpacity(.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: FittedBox(
                    child: controller.game.board[index] == PlayerType.human
                        ? Text('X',
                            style: AppTypography.body.copyWith(
                              color: AppColors.xSelector,
                            ))
                        : controller.game.board[index] == PlayerType.computer
                            ? Text('O',
                                style: AppTypography.body.copyWith(
                                  color: AppColors.oSelector,
                                ))
                            : Text(''),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
