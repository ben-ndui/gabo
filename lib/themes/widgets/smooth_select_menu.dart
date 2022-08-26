import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gabo/themes/smooth_color.dart';

import '../configs.dart';

class SmoothSelectMenu extends StatelessWidget {
  final List<Widget> menu;
  final bool showMenuPop;
  final Color? bgColor;
  final double? vertical;

  const SmoothSelectMenu({
    Key? key,
    required this.menu,
    required this.showMenuPop,
    this.bgColor, this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildMessageMenu(context);
  }

  Widget buildMessageMenu(BuildContext context) {
    return Visibility(
      visible: showMenuPop,
      child: FadeInUp(
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: SmoothConfig.screenWidth! * 0.5,
          margin: EdgeInsets.symmetric(
            horizontal: SmoothConfig.screenWidth! * 0.1,
            vertical: vertical ?? SmoothConfig.screenWidth! * 0.02,
          ),
          decoration: BoxDecoration(
            color: bgColor ?? SmoothColor.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: SmoothColor.black.withOpacity(0.1),
                spreadRadius: 0.0,
                blurStyle: BlurStyle.outer,
                blurRadius: 40.0,
              ),
            ],
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: menu.length,
            itemBuilder: (ctx, index) {
              final item = menu[index];
              return item;
            },
          ),
        ),
      ),
    );
  }
}
