import 'package:tic_tac_toe/app/data/ia/ia_interface.dart';
import 'package:tic_tac_toe/app/data/models/game.dart';
import 'package:tic_tac_toe/app/data/services/checker_winner_service.dart';

class MiniMaxIa extends IaInterface {
  int winScore = 100;
  int drawScore = 0;
  int loseScore = -100;

  int autoMove({required Game game}) {
    return 1;
  }

  Move moveMiniMax(
      {required List<int> humanMoves, required List<int> computerMoves}) {
    Move bestMove = Move(position: -1, score: -100);

    /// Posições livres no tabuleiro
    List<int> board = [0, 1, 2, 3, 4, 5, 6, 7, 8];

    /// Remove as posições já jogadas
    board.removeWhere((index) => humanMoves.contains(index));
    board.removeWhere((index) => computerMoves.contains(index));

    board.map((e) => null);

    return bestMove;
  }

  int getScore({required List<int> moves}) {
    CheckerWinnerService checker = CheckerWinnerService();

    if (checker.isWinner(moves))
      return 100;
    else
      return 0;
  }
}

class Move {
  int position;
  int score;

  Move({required this.position, required this.score});
}
