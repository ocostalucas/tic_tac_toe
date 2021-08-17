import 'package:tic_tac_toe/app/data/ia/easy_ia.dart';
import 'package:tic_tac_toe/app/data/ia/normal_ia.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_images.dart';

import 'enums/player_type.dart';
import 'enums/user_type.dart';
import 'ia/hard_ia.dart';
import 'models/player.dart';

class Players {
  static Player getPlayer(UserType type) {
    switch (type) {
      case UserType.easyComputer:
        return Player(
          name: 'Fácil',
          seletor: 'O',
          selectorColor: AppColors.oSelector,
          logo: AppImages.easy,
          type: PlayerType.computer,
          ia: EasyIa(),
        );

      case UserType.normalComputer:
        return Player(
          name: 'Normal',
          seletor: 'O',
          selectorColor: AppColors.oSelector,
          logo: AppImages.normal,
          type: PlayerType.computer,
          ia: NormalIa(),
        );

      case UserType.hardComputer:
        return Player(
          name: 'Difícil',
          seletor: 'O',
          selectorColor: AppColors.oSelector,
          logo: AppImages.hard,
          type: PlayerType.computer,
          ia: HardIa(),
        );

      default:
        return Player(
          name: 'Você',
          seletor: 'X',
          selectorColor: AppColors.xSelector,
          logo: AppImages.player,
          type: PlayerType.human,
        );
    }
  }
}
