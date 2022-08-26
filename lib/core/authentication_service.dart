import 'package:firebase_auth/firebase_auth.dart';
import 'package:gabo/core/app_user.dart';

class AuthService {
  final FirebaseAuth _instance = FirebaseAuth.instance;

  Stream<AppUser?> authChanges() {
    final user = _instance.authStateChanges().map(userFromStream);
    return user;
  }

  AppUser userFromStream(User? user, [String? pseudo]) {
    //print("Authentication_services : l.13 \n $user");
    return AppUser(
      uid: user!.uid,
      userName: pseudo ?? user.displayName ?? "Ano${user.uid.substring(0, 5)}",
      lastName: "",
      email: user.email ?? "",
      phone: user.phoneNumber ?? "",
    );
  }

  Future<AppUser?> loginAnonymous(String pseudo) async {
    try{
      final UserCredential fireAuthUser = await _instance.signInAnonymously();
      return userFromStream(fireAuthUser.user, pseudo);
    } on FirebaseAuthException catch(e){
      return null;
    }
  }

  void logout() {
    _instance.signOut();
  }
}
