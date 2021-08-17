import 'dart:math';

import 'package:tic_tac_toe/app/data/ia/ia_interface.dart';
import 'package:tic_tac_toe/app/data/models/game.dart';

/// Gera movimento aleatório de acordo com
/// as posições livres do tabuleiro
class EasyIa extends IaInterface {
  @override
  int autoMove({required Game game}) {
    /// Posições livres no tabuleiro
    List<int> board = [0, 1, 2, 3, 4, 5, 6, 7, 8];

    /// Remove as posições já jogadas
    board.removeWhere((index) => game.humanMoves.contains(index));
    board.removeWhere((index) => game.computerMoves.contains(index));

    /// Gera um index aleatorio no intervalo a partir de
    /// 0 a quantidade de posições livres do tabuleiro
    int index = Random().nextInt(board.length);
    return board[index];
  }
}
