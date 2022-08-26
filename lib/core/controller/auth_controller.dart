
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/authentication_service.dart';
import 'package:gabo/router/router.gr.dart';

import '../services/users_services.dart';

class AuthController extends ChangeNotifier{
  final AuthService authService = AuthService();

  final TextEditingController pseudoController = TextEditingController();

  AppUser? currentUser;

  String pseudo = "";

  String? errorPseudo;

  Future<AppUser?> loginAnonymously(BuildContext context) async {
    final usr = await authService.loginAnonymous(pseudo);

    if(usr != null){
      currentUser = usr;
      myReset();
      notifyListeners();
      context.router.replace(const Redirection());
    }
    return null;
  }



  void setPseudo(String p1) {
    pseudo = p1;
    notifyListeners();
  }

  String? validator(String? p1) {
    if(p1 == null || p1.isEmpty){
      return "Veuillez saisir un pseudo s'il vous plait";
    }else{
      return null;
    }
  }

  void setPseudoError(String s) {
    errorPseudo = s;
    notifyListeners();
  }

  void logout(BuildContext context) {
    authService.logout();
    currentUser = null;
    notifyListeners();
    context.router.replace(const Redirection());
  }

  void myReset() {
    pseudo = "";
    errorPseudo = null;
    pseudoController.clear();
    notifyListeners();
  }

  void checkSignIn(BuildContext context) {
    if(currentUser == null){
      authService.logout();
      context.router.replace(const Redirection());
    }
  }
}