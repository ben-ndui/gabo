import 'package:flutter/material.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/authentication_service.dart';
import 'package:gabo/themes/widgets/smooth_text.dart';
import 'package:gabo/view/auth/login.dart';
import 'package:gabo/view/home/home.dart';

class Redirection extends StatelessWidget {
  const Redirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser?>(
        stream: AuthService().authChanges(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Login();
          }else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Scaffold(body: Center(child: SmoothText(text: snapshot.error.toString(),)));
          }else {
            return const Home();
          }
        });
  }
}
