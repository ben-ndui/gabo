import 'package:flutter/material.dart';
import 'package:gabo/core/controller/auth_controller.dart';
import 'package:gabo/themes/configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gabo/router/router.gr.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SmoothConfig().init(context);

    return Consumer<AuthController>(
      builder: (context, controller, child) {
        controller.checkSignIn(context);
        return Scaffold(
          appBar: SmoothUtile().buildAppBar(
            title: "Bonjour, ${controller.currentUser?.userName}",
            bgColor: SmoothColor.green,
          ),
          body: buildBody(context),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<AuthController>().logout(context);
            },
            backgroundColor: SmoothColor.red,
            child: const FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
            ),
          ),
        );
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      width: SmoothConfig.screenWidth,
      height: SmoothConfig.screenHeight,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildButtom(
                title: "Créer",
                color: SmoothColor.accent,
                action: () {
                  context.router.push(const CreateGame());
                },
              ),
              buildButtom(
                color: SmoothColor.green,
                title: "Rejoindre",
                action: () {
                  context.router.push(const WaitingRoom());
                },
              ),
            ],
          ),
          //deconnexionButton(context),
        ],
      ),
    );
  }

  Widget deconnexionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          buildButtom(
              title: "Deconnexion",
              action: () {
                context.read<AuthController>().logout(context);
              },
              color: SmoothColor.red)
        ],
      ),
    );
  }

  Widget buildButtom({
    required String title,
    required void Function() action,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SmoothConfig.screenWidth! * 0.1, vertical: SmoothUtile.kDefaultHorizontalPadding,),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: action,
              style: TextButton.styleFrom(
                elevation: 0.0,
                backgroundColor: color ?? SmoothColor.primary,
                primary: SmoothColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SmoothUtile.kDefaultRadius),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: SmoothConfig.screenHeight! * 0.02,
                  horizontal: SmoothUtile.kDefaultHorizontalPadding,
                ),
              ),
              child: SmoothText(text: title),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildExpanded() {
    return Expanded(
      child: Container(
        width: SmoothConfig.screenWidth,
        height: 100.0,
        margin: EdgeInsets.symmetric(
          horizontal: SmoothUtile.kDefaultHorizontalPadding,
          vertical: SmoothUtile.kDefaultVerticalPadding,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: SmoothColor.grey,
          borderRadius: BorderRadius.circular(SmoothUtile.kDefaultRadius25),
          boxShadow: [
            BoxShadow(
                color: SmoothColor.black.withOpacity(0.15),
                spreadRadius: SmoothUtile.kDefaultSpreadRadius,
                blurRadius: SmoothUtile.kDefaultBlurRadius,
                blurStyle: BlurStyle.outer)
          ],
        ),
        child: SmoothText(
          text: "Créer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SmoothConfig.screenWidth! * 0.05,
          ),
        ),
      ),
    );
  }
}
