import 'dart:math';

import 'package:tic_tac_toe/app/data/ia/ia_interface.dart';
import 'package:tic_tac_toe/app/data/models/game.dart';
import 'package:tic_tac_toe/app/data/services/checker_winner_service.dart';

class HardIa extends IaInterface {
  @override
  int autoMove({required Game game}) {
    /// Posições livres no tabuleiro
    List<int> emptyPositions = getEmptyPositions(game: game);

    for (int positon in emptyPositions) {
      if (winnerPosition(game: game, position: positon)) {
        return positon;
      }
    }

    int index = Random().nextInt(emptyPositions.length);
    return emptyPositions[index];
  }

  //// Verifica se a posição é uma chance de vitória para algums do players
  bool winnerPosition({required Game game, required int position}) {
    CheckerWinnerService checker = CheckerWinnerService();
    List<int> computerMoves = List.from(game.computerMoves);
    computerMoves.add(position);

    List<int> humanMoves = List.from(game.humanMoves);
    humanMoves.add(position);
    return checker.isWinner(computerMoves) || checker.isWinner(humanMoves);
  }
}
