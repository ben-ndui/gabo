
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gabo/core/app_user.dart';

class UsersServices{
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  final String colName = "users";

  Future<void> saveUser(AppUser user) async {
    try{
      return _instance.collection(colName).doc(user.uid).set(user.toJson());
    }on FirebaseException catch(e){
      print(e.message);
    }
  }

  Future<void> updateUser(AppUser user) async {
    try{
      return _instance.collection(colName).doc(user.uid).update(user.toJson());
    }on FirebaseException catch(e){
      print(e.message);
    }
  }

  Future<void> deleteUser(AppUser user) async {
    try{
      return _instance.collection(colName).doc(user.uid).delete();
    }on FirebaseException catch(e){
      print(e.message);
    }
  }

  Stream<AppUser>? getUser(String userUid) {
    try{
      return _instance.collection(colName).doc(userUid).snapshots().map((event) => AppUser.fromJson(event));
    }on FirebaseException catch(e){
      print(e.message);
      return null;
    }
  }

}