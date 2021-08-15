import 'package:tic_tac_toe/app/data/enums/player_type.dart';

import 'package:mobx/mobx.dart';
part 'game_controller.g.dart';

class GameController = _GameControllerBase with _$GameController;

abstract class _GameControllerBase with Store {
  _GameControllerBase() {
    init();
  }

  @action
  void init() {
    playerMoves.clear();
    computerMoves.clear();
  }

  @observable
  ObservableList<PlayerType> board = <PlayerType>[
    PlayerType.none,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none,
    PlayerType.none
  ].asObservable();

  @observable
  PlayerType playerTurn = PlayerType.player;

  List<int> playerMoves = [];
  List<int> computerMoves = [];

  void move({required int position}) {
    if (playerTurn == PlayerType.player)
      playerMove(position: position);
    else
      computerMove(position: position);
  }

  @action
  void playerMove({required int position}) {
    board[position] = PlayerType.player;
    playerMoves.add(position);
    playerTurn = PlayerType.computer;
  }

  @action
  void computerMove({required int position}) {
    board[position] = PlayerType.computer;
    computerMoves.add(position);
    playerTurn = PlayerType.player;
  }
}
