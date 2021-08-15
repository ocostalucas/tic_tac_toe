// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameController on _GameControllerBase, Store {
  final _$boardAtom = Atom(name: '_GameControllerBase.board');

  @override
  ObservableList<PlayerType> get board {
    _$boardAtom.reportRead();
    return super.board;
  }

  @override
  set board(ObservableList<PlayerType> value) {
    _$boardAtom.reportWrite(value, super.board, () {
      super.board = value;
    });
  }

  final _$_GameControllerBaseActionController =
      ActionController(name: '_GameControllerBase');

  @override
  void init() {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.init');
    try {
      return super.init();
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playerMove({required int position}) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.playerMove');
    try {
      return super.playerMove(position: position);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void computerMove({required int position}) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.computerMove');
    try {
      return super.computerMove(position: position);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
board: ${board}
    ''';
  }
}
