import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gabo/themes/smooth_utils.dart';

class SmoothText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? duration;

  const SmoothText({
    Key? key,
    required this.text,
    this.textAlign,
    this.style,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothUtile().smoothFadeIn(
      duration: duration,
      child: AutoSizeText(
        text,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
