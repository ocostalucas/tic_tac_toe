// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameController on _GameControllerBase, Store {
  final _$gameAtom = Atom(name: '_GameControllerBase.game');

  @override
  Game get game {
    _$gameAtom.reportRead();
    return super.game;
  }

  @override
  set game(Game value) {
    _$gameAtom.reportWrite(value, super.game, () {
      super.game = value;
    });
  }

  final _$newGameAsyncAction = AsyncAction('_GameControllerBase.newGame');

  @override
  Future<void> newGame() {
    return _$newGameAsyncAction.run(() => super.newGame());
  }

  final _$humanMoveAsyncAction = AsyncAction('_GameControllerBase.humanMove');

  @override
  Future<void> humanMove({required int position}) {
    return _$humanMoveAsyncAction
        .run(() => super.humanMove(position: position));
  }

  final _$computerMoveAsyncAction =
      AsyncAction('_GameControllerBase.computerMove');

  @override
  Future<void> computerMove() {
    return _$computerMoveAsyncAction.run(() => super.computerMove());
  }

  final _$_GameControllerBaseActionController =
      ActionController(name: '_GameControllerBase');

  @override
  void onChange(
      {DocumentReference<Object?>? reference,
      List<PlayerType>? board,
      PlayerType? playerTurn,
      PlayerType? winner,
      List<int>? humanMoves,
      List<int>? computerMoves,
      DifficultyType? difficulty}) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.onChange');
    try {
      return super.onChange(
          reference: reference,
          board: board,
          playerTurn: playerTurn,
          winner: winner,
          humanMoves: humanMoves,
          computerMoves: computerMoves,
          difficulty: difficulty);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTurn({required PlayerType turn}) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.changeTurn');
    try {
      return super.changeTurn(turn: turn);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToBoard({required int position, required PlayerType player}) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.addToBoard');
    try {
      return super.addToBoard(position: position, player: player);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkWinner() {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.checkWinner');
    try {
      return super.checkWinner();
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
game: ${game}
    ''';
  }
}
