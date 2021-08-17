import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/data/enums/difficulty_type.dart';
import 'package:tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:tic_tac_toe/app/shared/components/buttons/round_button_widget.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

import 'components/select_difficult_button_widget.dart';

class ConfigScreen extends StatelessWidget {
  final GameController controller;
  ConfigScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: RoundButtonWidget(
                            onTap: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back_ios_new,
                                color: Colors.white)),
                      ),
                      Text('Selecione a dificuldade',
                          style: AppTypography.title)
                    ],
                  ),
                  SelectDifficultButtonWidget(
                      gameController: controller,
                      difficulty: DifficultyType.easy),
                  SelectDifficultButtonWidget(
                      gameController: controller,
                      difficulty: DifficultyType.normal),
                  SelectDifficultButtonWidget(
                      gameController: controller,
                      difficulty: DifficultyType.hard),
                  Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
