import 'package:flutter/material.dart';

import '../../themes/widgets/smooth_text.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SmoothText(text: "Connexion"),),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container();
  }
}
