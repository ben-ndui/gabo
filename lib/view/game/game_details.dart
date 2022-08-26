import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/controller/game_controller.dart';
import 'package:gabo/core/game_model.dart';
import 'package:gabo/core/services/game_services.dart';
import 'package:gabo/core/services/game_users_services.dart';
import 'package:gabo/router/router.gr.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class GameDetails extends StatefulWidget {
  const GameDetails({Key? key}) : super(key: key);

  @override
  State<GameDetails> createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  @override
  Widget build(BuildContext context) {
    final gameController = context.read<GameController>();
    return Scaffold(
      appBar: SmoothUtile().buildAppBar(
        title: "Salle : ${gameController.gameSelected?.title}",
        bgColor: SmoothColor.green,
        iconColor: SmoothColor.white,
        leading: FadeIn(
          delay: const Duration(milliseconds: 300),
          child: IconButton(onPressed: (){
            context.read<GameController>().leaveGame(context);
          }, icon: const FaIcon(FontAwesomeIcons.chevronLeft)),
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Consumer<GameController>(
        builder: (context, controller, child) {
          return StreamBuilder<List<AppUser>?>(
              stream: GameUsersServices()
                  .getAllParticipantsByGameUid(controller.gameSelected!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Container();
                final users = snapshot.data;

                return users != null
                    ? SizedBox(
                  width: SmoothConfig.screenWidth,
                  height: SmoothConfig.screenHeight,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SmoothConfig.screenWidth! * 0.12,
                            vertical: SmoothConfig.screenWidth! * 0.02),
                        child: Row(
                          children: [
                            SmoothText(
                              text: "Participants",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: SmoothColor.green,
                                  fontSize:
                                  SmoothConfig.screenWidth! * 0.04),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final singleUser = users[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(100.0),
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: ListTile(
                                leading: const FaIcon(
                                  FontAwesomeIcons.user,
                                  color: SmoothColor.accent,
                                ),
                                title: SmoothText(
                                  text: singleUser.userName,
                                  style: const TextStyle(
                                      color: SmoothColor.accent),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            SmoothConfig.screenWidth! * 0.055),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  //TODO : Launch game
                                  if (users.length >=
                                      int.parse(controller
                                          .gameSelected!.nbJoueur)) {
                                    context.router
                                        .replace(const GameScreen());
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: SmoothConfig
                                                      .screenWidth,
                                                  height: 70.0,
                                                  color: SmoothColor.green,
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Lottie.asset(
                                                          "assets/lottie/stop.json"),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: SmoothConfig
                                                      .screenWidth,
                                                  height: 100.0,
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0),
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                          height: 5.0),
                                                      const SmoothText(
                                                        text: "Il manque des joueurs, souhaitez vous commencer quand même la partie ?",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style:
                                                        TextStyle(
                                                          color: SmoothColor
                                                              .danger,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          TextButton(
                                                              onPressed: () {
                                                                //TODO: Leave the party
                                                                //Send message to everyone
                                                                context.router
                                                                    .replace(
                                                                  const GameScreen(),
                                                                );
                                                              },
                                                              child:
                                                              const SmoothText(
                                                                text: "Oui",
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                //TODO: Leave the party
                                                                context.router
                                                                    .pop();
                                                              },
                                                              child:
                                                              const SmoothText(
                                                                text: "Non",
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                    );
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: SmoothColor.green,
                                  primary: SmoothColor.white,
                                  padding: const EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(100.0),
                                  ),
                                ),
                                child: const SmoothText(
                                  text: "Commencer la parties",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    : Container(
                  alignment: Alignment.center,
                  child: const SmoothText(
                    text:
                    "Aucun participants chargé... impossible, il y a au moins un participant, l'hote..",
                  ),
                );
              });
        },
      ),
    );
  }
}
