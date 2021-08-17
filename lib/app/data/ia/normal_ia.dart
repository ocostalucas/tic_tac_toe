import 'dart:math';

import 'package:tic_tac_toe/app/data/ia/ia_interface.dart';
import 'package:tic_tac_toe/app/data/models/game.dart';
import 'package:tic_tac_toe/app/data/services/checker_winner_service.dart';

class NormalIa extends IaInterface {
  int autoMove({required Game game}) {
    /// Posições livres no tabuleiro
    List<int> emptyPositions = getEmptyPositions(game: game);

    /// Verifica nas possições disponiveis
    /// Se há uma possibilidade de vitória
    for (int positon in emptyPositions) {
      if (positonWinner(game: game, position: positon)) {
        return positon;
      }
    }

    /// Caso não tenha uma possibilidade de vitória
    /// é retornado uma posição aleatória
    int index = Random().nextInt(emptyPositions.length);
    return emptyPositions[index];
  }

  ///Verifica se a posição é uma jogada de vitória
  bool positonWinner({required Game game, required int position}) {
    CheckerWinnerService checker = CheckerWinnerService();
    List<int> moves = List.from(game.computerMoves);
    moves.add(position);

    if (checker.isWinner(moves))
      return true;
    else
      return false;
  }
}
