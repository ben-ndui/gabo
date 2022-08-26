import 'package:flutter/material.dart';
import 'package:gabo/core/controller/auth_controller.dart';
import 'package:gabo/core/controller/game_controller.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gabo/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

class CreateSaloon extends StatefulWidget {
  const CreateSaloon({Key? key}) : super(key: key);

  @override
  State<CreateSaloon> createState() => _CreateSaloonState();
}

class _CreateSaloonState extends State<CreateSaloon> {
  final createGameFormKey = GlobalKey<FormState>();
  final List<String> items = <String>['2', '3', '4', '5'];
  String selectedItem = '2';
  bool showDropDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showDropDown = showDropDown == true ? false : false;
        });
      },
      child: Scaffold(
        appBar: SmoothUtile().buildAppBar(leading: FadeIn(
          delay: const Duration(milliseconds: 300),
          child: IconButton(onPressed: (){
            context.router.pop();
          }, icon: const FaIcon(FontAwesomeIcons.chevronDown)),
        )),
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    final controller = context.read<GameController>();
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothText(
                      text: "Créer une partie",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SmoothConfig.screenWidth! * 0.05,
                        color: SmoothColor.green,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Center(
                      child: Form(
                        key: createGameFormKey,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            buildTextFormField(context: context, placeholder: "nom de la partie", controller: controller),
                            buildSmoothSelect(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextButton(
                    onPressed: () {
                      controller.createGame(context, context.read<AuthController>().currentUser!);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: SmoothColor.green,
                      primary: SmoothColor.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: const SmoothText(text: "Créer une partie"),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSmoothSelect(BuildContext context) {
    final controller = context.read<GameController>();

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            toggleDropDown();
          },
          child: Container(
            width: SmoothConfig.screenWidth,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: SmoothColor.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SmoothUtile().smoothFadeIn(
                    child: SmoothText(
                      text: selectedItem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SmoothConfig.screenWidth! * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: FaIcon(
                    FontAwesomeIcons.chevronDown,
                    size: 18.0,
                  ),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: showDropDown,
          child: FadeInUp(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 30.0,
              ),
              decoration: BoxDecoration(
                color: SmoothColor.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: SmoothColor.secondary.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  final item = items[index];
                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectedItem = item;
                      });
                      ctx.read<GameController>().setNbPlayer(selectedItem);
                      toggleDropDown();
                    },
                    title: SmoothText(
                      text: item,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  void toggleDropDown() {
    return setState(() {
      showDropDown = !showDropDown;
    });
  }

  Widget buildTextFormField({required BuildContext context, required String placeholder, required GameController controller}) {
    //final controller = context.read<GameController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextFormField(
        controller: controller.partyNameController,
        onChanged: controller.setPartyName,
        onFieldSubmitted: controller.setPartyName,
        textAlign: TextAlign.center,
        validator: (val) => val == null || val.isEmpty ? "Veuillez saisir le nom de la partie s'il vous plait" : null,
        decoration: InputDecoration(
          hintText: placeholder,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(SmoothUtile.kDefaultRadius),
          ),
        ),
      ),
    );
  }
}
