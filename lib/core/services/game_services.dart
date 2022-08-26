import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gabo/core/game_model.dart';

class GameServices{

  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final colName = "games";
  final collAll = "all";

  Future<void> createGame(GameModel game) async {
    return await _instance.collection(colName).doc(game.uid).set(game.toJson());
  }

  void updateGame(GameModel game){
    _instance.collection(colName).doc(game.uid).update(game.toJson());
  }

  void deleteGame(GameModel game){
    _instance.collection(colName).doc(game.uid).delete();
  }

  Future<GameModel> getGameByUid(String gameUid){
    return _instance.collection(colName).doc(gameUid).get().then((val) => GameModel.fromJson(val));
  }

  Future<List<GameModel>> getGameByUserUid(String userUid){
    return _instance.collection(colName)
        .where('createdBy', isEqualTo: userUid)
        .get()
        .then((val) {
      return val.docs.map((e) => GameModel.fromJson(e)).toList();
    });
  }

  Stream<List<GameModel>> getAllGamesOnLoad(){
    return _instance.collection(colName).snapshots().map((event) => event.docs.map((e) => GameModel.fromJson(e)).toList());
  }

  String getNewId() {
    return _instance.collection(colName).doc().id;
  }
}