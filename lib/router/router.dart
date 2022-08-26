import 'package:auto_route/auto_route.dart';
import 'package:gabo/view/account/profile.dart';
import 'package:gabo/view/account/profile_details.dart';
import 'package:gabo/view/auth/login.dart';
import 'package:gabo/view/auth/redirection.dart';
import 'package:gabo/view/auth/register.dart';
import 'package:gabo/view/game/game_details.dart';
import 'package:gabo/view/home/home.dart';
import 'package:gabo/view/game/game.dart';
import 'package:gabo/view/saloon/saloon.dart';
import 'package:gabo/view/saloon/create_saloon.dart';
import 'package:gabo/view/settings/settings.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    CustomRoute(page: Login, path: "/connexion", name: "Connexion",transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: Register, path: "/inscription", name: "Inscription", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: Redirection, path: "/redirection", name: "Redirection", initial: true, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: Home, path: "/accueil", name: "Accueil", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: Saloon, path: "/salle-d-attente", name: "WaitingRoom", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: CreateSaloon, path: "/creer-une-partie", name: "CreateGame", transitionsBuilder: TransitionsBuilders.slideBottom),
    CustomRoute(page: Game, path: "/jeu", name: "GameScreen", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: GameDetails, path: "/details", name: "DetailsGame", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: Profile, path: "/profile/:id", name: "Profile", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ProfileDetails, path: "/profile/details/:id", name: "DetailsProfile", transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: Settings, path: "/reglage", name: "Reglage", transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AppRouter {}