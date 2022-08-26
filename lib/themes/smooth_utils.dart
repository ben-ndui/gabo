import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'smooth_color.dart';
import 'widgets/smooth_text.dart';

class SmoothUtile {
  static const kCardWidgetWidth = 100.0;
  static const kCardWidgetHeight = 150.0;
  static const kDefaultRadius = 45.0;
  static const kDefaultRadius4 = 4.0;
  static const kDefaultRadius15 = 10.0;
  static const kDefaultRadius25 = 25.0;
  static const kDefaultBlurRadius = 10.0;
  static const kDefaultSpreadRadius = 0.0;
  static const kDefaultVerticalPadding = 10.0;
  static const kDefaultHorizontalPadding = 10.0;

  //ANIMATION
  Widget smoothFadeIn({required Widget child, int? duration}) {
    return FadeIn(
      duration: Duration(milliseconds: duration ?? 500),
      child: child,
    );
  }

  AppBar buildAppBar({String? title, Color? bgColor, Color? iconColor, Widget? leading}) {
    return AppBar(
      elevation: 0.0,
      shadowColor: SmoothColor.black.withOpacity(0.2),
      backgroundColor: bgColor ?? SmoothColor.transparent,
      iconTheme: IconThemeData(color: iconColor ?? SmoothColor.green),
      shape: const RoundedRectangleBorder(
        //borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0)),
      ),
      leading: leading,
      title: SmoothText(
        text: title ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: bgColor != null && bgColor != SmoothColor.white && bgColor != SmoothColor.transparent ? SmoothColor.white : SmoothColor.green,
        ),
      ),
    );
  }
}
