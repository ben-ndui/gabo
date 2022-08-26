import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/controller/auth_controller.dart';
import 'package:gabo/core/game_model.dart';
import 'package:gabo/core/services/game_services.dart';
import 'package:gabo/core/services/game_users_services.dart';
import 'package:gabo/view/game/game_details.dart';
import 'package:provider/provider.dart';

import '../../router/router.gr.dart';
import '../../themes/smooth_color.dart';
import '../../themes/widgets/smooth_text.dart';

class GameController extends ChangeNotifier {
  final GameServices gameServices = GameServices();
  final GameUsersServices gameUserServices = GameUsersServices();

  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController nbPlayerController = TextEditingController();

  GameModel? gameSelected;

  String partyName = "";
  String nbPlayer = "";

  void setGameSelected(GameModel newGame) {
    gameSelected = newGame;
    notifyListeners();
  }

  void setPartyName(String newName) {
    partyName = newName;
    //notifyListeners();
  }

  void setNbPlayer(String newName) {
    nbPlayer = newName;
    //notifyListeners();
  }

  void createGame(BuildContext context, AppUser currentUser) {
    final gameUid = gameServices.getNewId();

    final GameModel game = GameModel(
      uid: gameUid,
      title: partyName,
      nbJoueur: nbPlayer,
      createdBy: currentUser.uid,
      date: DateTime.now(),
    );
    GameUsersServices().saveUser(game: game, appUser: currentUser);
    gameServices.createGame(game).then((value) {
      setGameSelected(game);
      context.router.push(const DetailsGame());
    });
  }

  void joinGame(BuildContext context, GameModel game) {
    final currentUser = context
        .read<AuthController>()
        .currentUser;

    GameUsersServices().saveUser(game: game, appUser: currentUser!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: SmoothColor.green,
        content: SmoothText(
          text: "Vous avez rejoins le salon '${gameSelected!.title}' !",
        ),
      ),
    );
    context.router.push(const DetailsGame());
  }

  void leaveGame(BuildContext context) {
    final currentUser = context
        .read<AuthController>()
        .currentUser;

    GameUsersServices().deleteUser(game: gameSelected!, appUser: currentUser!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: SmoothColor.green,
        content: SmoothText(
          text: "Vous avez quittez le salon '${context.read<GameController>().gameSelected!.title}' !",
        ),
      ),
    );
    context.router.replace(const WaitingRoom());
  }

  void goToChannel(BuildContext context) {
    if (gameSelected != null) {
      context.router.push(const DetailsGame());
    }
  }

  void addPlayerToGame(AppUser appUser, GameModel game) {
    gameUserServices.saveUser(game: game, appUser: appUser);
  }

  void removePlayerToGame(AppUser appUser, GameModel game) {
    gameUserServices.deleteUser(game: game, appUser: appUser);
  }
}
