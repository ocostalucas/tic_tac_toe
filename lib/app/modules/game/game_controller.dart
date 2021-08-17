import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tic_tac_toe/app/data/enums/player_type.dart';

import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe/app/data/enums/user_type.dart';
import 'package:tic_tac_toe/app/data/models/game.dart';
import 'package:tic_tac_toe/app/data/models/player.dart';
import 'package:tic_tac_toe/app/data/players.dart';
import 'package:tic_tac_toe/app/data/repositories/game_repository.dart';
import 'package:tic_tac_toe/app/data/services/checker_winner_service.dart';
part 'game_controller.g.dart';

class GameController = _GameControllerBase with _$GameController;

abstract class _GameControllerBase with Store {
  _GameControllerBase() {
    newGame();
  }
  GameRepository repository = GameRepository();

  /// Inicia um novo jogo
  @action
  Future<void> newGame() async {
    game = Game();

    /// Cria uma intancia do jogo no Firebase
    /// E adiciona a referência no model
    DocumentReference? reference = await repository.addGame(game: game);
    onChange(reference: reference);
  }

  @observable
  Game game = Game();

  @observable
  Player computer = Players.getPlayer(UserType.easyComputer);

  @action
  void onChange({
    DocumentReference? reference,
    List<PlayerType>? board,
    PlayerType? playerTurn,
    PlayerType? winner,
    List<int>? humanMoves,
    List<int>? computerMoves,
  }) {
    game = game.copyWith(
      reference: reference,
      board: board,
      playerTurn: playerTurn,
      winner: winner,
      humanMoves: humanMoves,
      computerMoves: computerMoves,
    );

    ///Atualiza a instância do jogo no Firebase
    if (game.reference != null) {
      repository.updateGame(game: game);
    }
  }

  void move({required int position}) {
    humanMove(position: position);
  }

  /// Movimento do player
  @action
  void humanMove({required int position}) {
    addToBoard(position: position, player: PlayerType.human);

    List<int> moves = List.from(game.humanMoves);
    moves.add(position);
    onChange(humanMoves: moves);

    checkWinner();

    if (game.hasMove && game.winner == null) {
      onChange(playerTurn: PlayerType.computer);
      computerMove();
    }
  }

  /// Movimento do computador
  @action
  Future<void> computerMove() async {
    int autoMove = computer.ia!.autoMove(game: game);

    await Future.delayed(Duration(milliseconds: 500));

    addToBoard(position: autoMove, player: PlayerType.computer);

    List<int> moves = List.from(game.computerMoves);
    moves.add(autoMove);
    onChange(computerMoves: moves);

    checkWinner();

    changeTurn(turn: PlayerType.human);
  }

  /// Altera o turno do jogo
  @action
  void changeTurn({required PlayerType turn}) {
    if (game.hasMove && game.winner == null) onChange(playerTurn: turn);
  }

  /// Adiciona jogada no tabuleiro
  @action
  void addToBoard({required int position, required PlayerType player}) {
    List<PlayerType> board = List.from(game.board);
    board[position] = player;
    onChange(board: board);
  }

  /// Verifica se há um vencedor
  @action
  void checkWinner() {
    CheckerWinnerService checker = CheckerWinnerService();
    PlayerType? winner;

    if (checker.isWinner(game.computerMoves))
      winner = PlayerType.computer;
    else if (checker.isWinner(game.humanMoves))
      winner = PlayerType.human;
    else if (!game.hasMove)
      winner = PlayerType.none;
    else
      winner = null;
    onChange(winner: winner);
  }
}
