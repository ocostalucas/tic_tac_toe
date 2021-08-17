import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:tic_tac_toe/app/data/enums/difficulty_type.dart';
import 'package:tic_tac_toe/app/data/enums/player_type.dart';
import 'package:tic_tac_toe/app/data/enums/user_type.dart';
import 'package:tic_tac_toe/app/data/models/player.dart';
import 'package:tic_tac_toe/app/data/players.dart';

class Game {
  final DocumentReference? reference;
  final List<PlayerType> board;
  final PlayerType playerTurn;
  final PlayerType? winner;
  final List<int> humanMoves;
  final List<int> computerMoves;
  final DifficultyType difficulty;
  Game({
    this.reference,
    this.board = const <PlayerType>[
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
      PlayerType.none,
    ],
    this.difficulty = DifficultyType.easy,
    this.humanMoves = const [],
    this.computerMoves = const [],
    this.playerTurn = PlayerType.human,
    this.winner,
  });

  Player get computer => Players.getPlayer(
        difficulty == DifficultyType.normal
            ? UserType.normalComputer
            : difficulty == DifficultyType.hard
                ? UserType.hardComputer
                : UserType.easyComputer,
      );

  bool get hasMove => (computerMoves.length + humanMoves.length) < 9;

  Game copyWith({
    DocumentReference? reference,
    List<PlayerType>? board,
    PlayerType? playerTurn,
    PlayerType? winner,
    List<int>? humanMoves,
    List<int>? computerMoves,
    DifficultyType? difficulty,
  }) {
    return Game(
      reference: reference ?? this.reference,
      board: board ?? this.board,
      playerTurn: playerTurn ?? this.playerTurn,
      winner: winner ?? this.winner,
      humanMoves: humanMoves ?? this.humanMoves,
      computerMoves: computerMoves ?? this.computerMoves,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'board': board
          .map((x) => x == PlayerType.human
              ? 'X'
              : x == PlayerType.computer
                  ? 'O'
                  : null)
          .toList(),
      'playerTurn': playerTurn == PlayerType.computer ? 'computer' : 'human',
      'winner': winner == PlayerType.human
          ? 'human'
          : winner == PlayerType.computer
              ? 'computer'
              : winner == PlayerType.none
                  ? 'draw'
                  : null,
      'humanMoves': humanMoves,
      'computerMoves': computerMoves,
      'difficulty': difficulty == DifficultyType.hard
          ? 'hard'
          : difficulty == DifficultyType.normal
              ? 'normal'
              : 'easy',
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Game(board: $board, playerTurn: $playerTurn, winner: $winner, humanMoves: $humanMoves, computerMoves: $computerMoves, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Game &&
        listEquals(other.board, board) &&
        other.playerTurn == playerTurn &&
        other.winner == winner &&
        listEquals(other.humanMoves, humanMoves) &&
        listEquals(other.computerMoves, computerMoves) &&
        other.difficulty == difficulty;
  }

  @override
  int get hashCode {
    return board.hashCode ^
        playerTurn.hashCode ^
        winner.hashCode ^
        humanMoves.hashCode ^
        computerMoves.hashCode ^
        difficulty.hashCode;
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      board: List<PlayerType>.from(map['board']?.map((x) => x == 'X'
          ? PlayerType.human
          : x == 'O'
              ? PlayerType.computer
              : PlayerType.none)),
      playerTurn: map['playerTurn'] == 'computer'
          ? PlayerType.computer
          : PlayerType.human,
      winner: map['winner'] == 'human'
          ? PlayerType.human
          : map['winner'] == 'computer'
              ? PlayerType.computer
              : map['winner'] == 'draw'
                  ? PlayerType.none
                  : null,
      humanMoves: List<int>.from(map['humanMoves']),
      computerMoves: List<int>.from(map['computerMoves']),
      difficulty: map['difficulty'] == 'hard'
          ? DifficultyType.hard
          : map['difficulty'] == 'normal'
              ? DifficultyType.normal
              : DifficultyType.easy,
    );
  }

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source));
}
