
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/game_model.dart';

class GameUsersServices {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  final colName = "participants";
  final colAll = "all";

  Future<void> saveUser({required GameModel game, required AppUser appUser}) async {
    try{
      return _instance
          .collection(colName)
          .doc(game.uid)
          .collection(colAll)
          .doc(appUser.uid)
          .set(appUser.toJson());
    }on FirebaseException catch (e){
      print(e.message);
    }
  }

  Future<void> updateUser({required GameModel game, required AppUser appUser}) async {
    try{
      return _instance
          .collection(colName)
          .doc(game.uid)
          .collection(colAll)
          .doc(appUser.uid)
          .update(appUser.toJson());
    }on FirebaseException catch (e){
      print(e.message);
    }
  }

  Future<void> deleteUser({required GameModel game, required AppUser appUser}) async {
    try{
      return _instance
          .collection(colName)
          .doc(game.uid)
          .collection(colAll)
          .doc(appUser.uid)
          .delete();
    }on FirebaseException catch (e){
      print(e.message);
    }
  }

  Stream<List<AppUser>>? getAllParticipantsByGameUid(String gameUid){
    try{
      //print(gameUid);
      return _instance
          .collection(colName)
          .doc(gameUid)
          .collection(colAll)
          .snapshots()
          .map((event) => event.docs.map((e) => AppUser.fromJson(e)).toList());
    }on FirebaseException catch(e){
      print("Can't load game users : ${e.message}");
      return null;
    }
  }
}