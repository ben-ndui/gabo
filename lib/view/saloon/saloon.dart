import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/services/game_users_services.dart';
import 'package:gabo/router/router.gr.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:gabo/core/services/game_services.dart';
import 'package:gabo/core/game_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../themes/widgets/smooth_game_widget.dart';

class Saloon extends StatefulWidget {
  const Saloon({Key? key}) : super(key: key);

  @override
  State<Saloon> createState() => _SaloonState();
}

class _SaloonState extends State<Saloon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmoothUtile().buildAppBar(title: "Salle d'attente"),
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: SmoothColor.green,
        onPressed: () async {
          //go to create screen
          context.router.push(const CreateGame());
        },
        child: const FaIcon(FontAwesomeIcons.penToSquare),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<List<GameModel>>(
      stream: GameServices().getAllGamesOnLoad(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          Container(
            width: SmoothConfig.screenWidth,
            height: SmoothConfig.screenHeight,
            alignment: Alignment.center,
            child: const SmoothText(
              text: "Aucun channel de jeu disponible pour le moment, crée une partie !!",
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: SmoothText(text: snapshot.error.toString()));
        }

        final allGames = snapshot.data;

        if (allGames != null && allGames.isNotEmpty) {
          return ListView.builder(
            itemCount: allGames.length,
            itemBuilder: (context, index) {
              final game = allGames[index];
              return StreamBuilder<List<AppUser>>(
                stream: GameUsersServices().getAllParticipantsByGameUid(game.uid),
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return Container(
                      width: SmoothConfig.screenWidth,
                      height: SmoothConfig.screenHeight,
                      alignment: Alignment.center,
                      child: const SmoothText(
                        text: "Aucun channel de jeu disponible pour le moment, crée une partie !!",
                      ),
                    );
                  }
                  if (snap.hasError) {
                    return SmoothText(text: snap.error.toString());
                  }

                  final allGameParticipants = snap.data;
                  bool menu = false;

                  return SmoothGameWidget(
                    allGameParticipants: allGameParticipants!,
                    game: game,
                  );
                },
              );
            },
          );
        } else {
          return Container(
            width: SmoothConfig.screenWidth,
            height: SmoothConfig.screenHeight,
            alignment: Alignment.center,
            child: SmoothText(
              text: "Aucun channel de jeu disponible pour le moment, \n Tu peux créer une partie via le bouton en bas a droite !!",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, color: SmoothColor.black.withOpacity(0.5)),
            ),
          );
        }
      },
    );
  }
}
