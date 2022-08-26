import 'package:flutter/material.dart';
import 'package:gabo/core/services/game_services.dart';
import 'package:gabo/themes/widgets/smooth_select_menu.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../core/app_user.dart';
import '../../core/controller/game_controller.dart';
import '../../core/game_model.dart';
import '../../core/services/game_users_services.dart';
import '../Configs.dart';
import '../smooth_color.dart';
import '../smooth_utils.dart';

class SmoothGameWidget extends StatefulWidget {
  final List<AppUser> allGameParticipants;
  final GameModel game;

  const SmoothGameWidget({
    Key? key,
    required this.allGameParticipants,
    required this.game,
  }) : super(key: key);

  @override
  State<SmoothGameWidget> createState() => _SmoothGameWidgetState();
}

class _SmoothGameWidgetState extends State<SmoothGameWidget> {
  bool showGameMenu = false;

  @override
  Widget build(BuildContext context) {
    return smoothCard(context);
  }

  GestureDetector smoothCard(
    BuildContext context,
  ) {
    return GestureDetector(
      onLongPress: () {
        toggleGameMenu();
      },
      onTap: () {
        if (widget.allGameParticipants.length <
            int.parse(widget.game.nbJoueur)) {
          context.read<GameController>().setGameSelected(widget.game);
          context.read<GameController>().joinGame(context, widget.game);
        } else {
          buildShowDialog(context);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SmoothSelectMenu(
            menu: getMenuList(context),
            showMenuPop: showGameMenu,
          ),
          buildCard(widget.game),
        ],
      ),
    );
  }

  List<Widget> getMenuList(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          //GameServices().deleteGame(widget.game);
          toggleGameMenu();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: SmoothColor.green,
              content: SmoothText(
                text: "La partie '${widget.game.title}' à bien été supprimé !",
              ),
            ),
          );
        },
        child: const SmoothText(text: 'Supprimer'),
      )
    ];
  }

  Widget buildCard(GameModel game) {
    return SmoothUtile().smoothFadeIn(
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: SmoothConfig.screenWidth! * 0.04,
          vertical: SmoothConfig.screenWidth! * 0.02,
        ),
        shadowColor: SmoothColor.secondary.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3.0,
        child: SizedBox(
          height: 70.0,
          child: Row(
            children: [
              Container(
                width: 50.0,
                height: SmoothConfig.screenHeight,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: SmoothColor.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Lottie.asset(
                  "assets/lottie/cardGameAnimation.json",
                  fit: BoxFit.cover,
                  width: SmoothConfig.screenWidth,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: SmoothText(
                    text: game.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<List<AppUser>?>(
                          stream: GameUsersServices()
                              .getAllParticipantsByGameUid(game.uid),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SmoothText(
                                text: "Pas de joueur présent dans ce salon !",
                              );
                            }

                            if (snapshot.hasError) {
                              return SmoothText(
                                text: snapshot.error.toString(),
                              );
                            }

                            final allUsers = snapshot.data;
                            //print(allUsers?.toList());

                            return allUsers != null
                                ? Expanded(
                                    child: Row(
                                      children: allUsers.map((e) {
                                        final usr = e;
                                        return SmoothText(
                                          text: '${usr.userName}, ',
                                          style: TextStyle(
                                            color: SmoothColor.secondary
                                                .withOpacity(0.5),
                                            fontStyle: FontStyle.italic,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : const SmoothText(text: "text");
                          }),
                      Row(
                        children: [
                          const SmoothText(
                            text: "Joueur Max",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: SmoothColor.green,
                              fontSize: 5.0,
                            ),
                          ),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: SmoothColor.green,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: SmoothText(
                              text: game.nbJoueur,
                              style: const TextStyle(
                                color: SmoothColor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> buildShowDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: SmoothConfig.screenWidth,
              height: 70.0,
              color: SmoothColor.green,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lottie/stop.json"),
                ],
              ),
            ),
            Container(
              width: SmoothConfig.screenWidth,
              height: 100.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: const [
                  SizedBox(height: 5.0),
                  SmoothText(
                    text:
                        "Aie, nombre de participant atteint pour cette partie..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: SmoothColor.danger,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SmoothText(
                    text:
                        "Essaie de rejoindre une autre partie ou crées-en une !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: SmoothColor.green,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleGameMenu() {
    setState(() {
      showGameMenu = !showGameMenu;
    });
  }
}
