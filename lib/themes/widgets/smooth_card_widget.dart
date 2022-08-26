import 'package:flutter/material.dart';
import 'package:gabo/core/smooth_card_model.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/smooth_utils.dart';

class SmoothCardWidget extends StatelessWidget {
  final SmoothCardModel card;

  const SmoothCardWidget({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SmoothConfig().init(context);

    return Container(
      width: SmoothUtile.kCardWidgetWidth,
      height: SmoothUtile.kCardWidgetHeight,
      padding: EdgeInsets.zero,
      decoration: buildBoxDecoration(),
      child: Image.network(
        card.img,
        fit: BoxFit.cover,
        width: SmoothConfig.screenWidth,
        height: SmoothConfig.screenHeight,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(SmoothUtile.kDefaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.3),
            blurStyle: BlurStyle.outer,
            blurRadius: SmoothUtile.kDefaultBlurRadius,
            spreadRadius: SmoothUtile.kDefaultSpreadRadius,
          )
        ]);
  }
}
