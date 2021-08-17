import 'dart:math';

import 'package:tic_tac_toe/app/data/ia/ia_interface.dart';
import 'package:tic_tac_toe/app/data/models/game.dart';

/// Gera movimento aleatório de acordo com
/// as posições livres do tabuleiro
class EasyIa extends IaInterface {
  @override
  int autoMove({required Game game}) {
    List<int> emptyPositions = getEmptyPositions(game: game);

    /// Gera um index aleatorio no intervalo a partir de
    /// 0 a quantidade de posições livres do tabuleiro
    int index = Random().nextInt(emptyPositions.length);
    return emptyPositions[index];
  }
}
