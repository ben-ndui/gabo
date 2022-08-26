import 'package:flutter/material.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:gabo/themes/widgets/smooth_select.dart';
import 'package:gabo/themes/smooth_utils.dart';
import 'package:gabo/themes/configs.dart';
import 'package:gabo/themes/smooth_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class SmoothSelect extends StatefulWidget {
  final bool visible;
  final String selected;
  final List<String> items;
  final void Function()? onTap;

  const SmoothSelect({Key? key, required this.visible, required this.selected, required this.items,this.onTap})
      : super(key: key);

  @override
  _SmoothSelectState createState() => _SmoothSelectState();
}

class _SmoothSelectState extends State<SmoothSelect> {

  @override
  Widget build(BuildContext context) {
    return buildSmoothSelect();
  }

  Widget buildSmoothSelect() {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: SmoothConfig.screenWidth,
            alignment: Alignment.center,
            padding:
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            margin:
            EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
                      text: widget.selected,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SmoothConfig.screenWidth! * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
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
          visible: widget.visible,
          child: FadeInUp(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
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
                itemCount: widget.items.length,
                itemBuilder: (ctx, index) {
                  final item = widget.items[index];
                  return ListTile(
                    onTap: widget.onTap,
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
}
