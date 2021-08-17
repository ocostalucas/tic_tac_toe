import 'package:tic_tac_toe/app/data/models/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameRepository {
  CollectionReference games = FirebaseFirestore.instance.collection('games');

  Future<DocumentReference?> addGame({required Game game}) async {
    return games
        .add(game.toMap())
        .then((value) => value)
        .catchError((error) => error);
  }

  Future<void> updateGame({required Game game}) async {
    game.reference!
        .update(game.toMap())
        .then((value) => value)
        .catchError((error) => error);
  }
}
