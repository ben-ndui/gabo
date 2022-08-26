import 'package:flutter/material.dart';
import 'package:gabo/themes/Configs.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/smooth_color.dart';

class SmoothTextfield extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final String? errorText;

  const SmoothTextfield({
    Key? key,
    required this.title,
    this.controller,
    this.onChange,
    this.onSubmit,
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SmoothConfig().init(context);

    return buildTextField();
  }

  Widget buildTextField() {
    return SmoothUtile().smoothFadeIn(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SmoothConfig.screenWidth! * 0.08,
          vertical: SmoothUtile.kDefaultVerticalPadding,
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChange,
          onFieldSubmitted: onSubmit,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            errorText: errorText,
            errorStyle: const TextStyle(fontStyle: FontStyle.italic),
            fillColor: SmoothColor.grey.withOpacity(0.45),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: SmoothUtile.kDefaultHorizontalPadding,
              vertical: 20.0,
            ),
            hintText: title,
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(SmoothUtile.kDefaultRadius),
            ),
          ),
        ),
      ),
    );
  }
}
