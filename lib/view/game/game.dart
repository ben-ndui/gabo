import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gabo/core/engine/game_engine.dart';
import 'package:gabo/router/router.gr.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:gabo/themes/widgets/smooth_card_widget.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../core/controller/auth_controller.dart';
import '../../core/controller/game_controller.dart';
import '../../themes/smooth_utils.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: SmoothUtile().buildAppBar(title: "SAS", bgColor: SmoothColor.green),
      body: buildBody(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: SmoothColor.red,
      onPressed: () {
        //TODO: leave the game;
        showDialog<String>(
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
                    children: [
                      const SizedBox(height: 5.0),
                      const SmoothText(
                        text: "Êtes-vous sur de vouloir quitter la partie ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: SmoothColor.danger,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                //TODO: Leave the party
                                //Send message to everyone
                                context
                                    .read<GameController>()
                                    .leaveGame(context);
                              },
                              child: const SmoothText(
                                text: "Oui",
                              )),
                          TextButton(
                              onPressed: () {
                                //TODO: Leave the party
                                context.router.pop();
                              },
                              child: const SmoothText(
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
      },
      child: Lottie.asset("assets/lottie/logout.json"),
    );
  }

  Widget buildBody(BuildContext context) {
    List<Widget> userCards = [
      Center(child: Image.asset("assets/cards/default/card_back_bleu.png")),
      Center(child: Image.asset("assets/cards/default/card_back_bleu.png")),
      Center(child: Image.asset("assets/cards/default/card_front_bleu.png")),
      Center(child: Image.asset("assets/cards/default/card_front_bleu.png")),
    ];
    final deck = context.read<GameEngine>().deck;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: SmoothConfig.screenWidth,
          height: SmoothConfig.screenHeight,
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/game_back.jpg",
            width: SmoothConfig.screenWidth,
            height: SmoothConfig.screenHeight,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          //color: SmoothColor.red,
          width: SmoothConfig.screenWidth,
          height: SmoothConfig.screenHeight! / 2.5,
          margin: EdgeInsets.only(bottom: SmoothConfig.screenHeight! * 0.1),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: deck.length,
                  itemBuilder: (ctx, index) {
                    final card = context.read<GameEngine>().deck[index];
                    print(card.name);
                    return SmoothCardWidget(card: card);
                  },
                ),
              ),
              buildUserCards(userCards),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildUserCards(List<Widget> userCards) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: SmoothConfig.screenWidth! * 0.1,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
        ),
        itemCount: userCards.length,
        itemBuilder: (ctx, index) {
          final userCard = userCards[index];
          return userCard;
        },
      ),
    );
  }
}
