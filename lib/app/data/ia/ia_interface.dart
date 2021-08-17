import 'package:tic_tac_toe/app/data/models/game.dart';

abstract class IaInterface {
  int autoMove({required Game game});

  /// Retorna as posições não jogadas do tabuleiro
  List<int> getEmptyPositions({required Game game}) {
    /// Posições livres no tabuleiro
    List<int> board = [0, 1, 2, 3, 4, 5, 6, 7, 8];

    /// Remove as posições já jogadas
    board.removeWhere((index) => game.humanMoves.contains(index));
    board.removeWhere((index) => game.computerMoves.contains(index));

    return board;
  }
}
