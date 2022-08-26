import 'package:flutter/material.dart';
import 'package:gabo/core/controller/auth_controller.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/widgets/smooth_textfield.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gabo/router/router.gr.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool btnColor = false;
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SmoothConfig().init(context);

    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final authController = context.read<AuthController>();

    return Container(
      alignment: Alignment.center,
      width: SmoothConfig.screenWidth,
      height: SmoothConfig.screenHeight,
      child: Form(
        key: loginFormKey,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/lottie/game.json",
                    width: SmoothConfig.screenWidth! / 2,
                  ),
                  SmoothText(
                    text: "Smooth Gabo",
                    style: TextStyle(
                      fontSize: SmoothConfig.screenWidth! * 0.06,
                      fontWeight: FontWeight.bold,
                      color: SmoothColor.green,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SmoothTextfield(
              title: "pseudo",
              controller: authController.pseudoController,
              onChange: authController.setPseudo,
              onSubmit: authController.setPseudo,
              validator: authController.validator,
              errorText: authController.errorPseudo,
            ),
            validateFormButton(context)
          ],
        ),
      ),
    );
  }

  Padding validateFormButton(BuildContext context) {
    final authController = context.read<AuthController>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SmoothConfig.screenWidth! * 0.08,
        vertical: SmoothUtile.kDefaultVerticalPadding,
      ),
      child: TextButton(
        onHover: (val) {
          setState(() {
            btnColor = val;
          });
        },
        onPressed: () {
          //TODO
          if (loginFormKey.currentState!.validate()) {
            authController.loginAnonymously(context);
          } else {
            authController.setPseudoError("Veuillez saisir un pseudo s'il vous plait !");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: SmoothColor.red,
                content: SmoothText(
                  text: "Veuillez saisir un pseudo s'il vous plait !",
                ),
              ),
            );
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(SmoothConfig.screenWidth! * 0.045),
          backgroundColor: btnColor ? SmoothColor.primary : SmoothColor.green,
          primary: SmoothColor.white,
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(100.0)),
        ),
        child: const SmoothText(text: "C'est parti !"),
      ),
    );
  }
}
