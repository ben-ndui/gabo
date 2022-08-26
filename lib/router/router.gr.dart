// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../view/account/profile.dart' as _i9;
import '../view/account/profile_details.dart' as _i10;
import '../view/auth/login.dart' as _i1;
import '../view/auth/redirection.dart' as _i3;
import '../view/auth/register.dart' as _i2;
import '../view/game/game.dart' as _i7;
import '../view/game/game_details.dart' as _i8;
import '../view/home/home.dart' as _i4;
import '../view/saloon/create_saloon.dart' as _i6;
import '../view/saloon/saloon.dart' as _i5;
import '../view/settings/settings.dart' as _i11;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    Connexion.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.Login(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    Inscription.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.Register(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    Redirection.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.Redirection(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    Accueil.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.Home(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    WaitingRoom.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.Saloon(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    CreateGame.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.CreateSaloon(),
          transitionsBuilder: _i12.TransitionsBuilders.slideBottom,
          opaque: true,
          barrierDismissible: false);
    },
    GameScreen.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.Game(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    DetailsGame.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.GameDetails(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    Profile.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.Profile(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    DetailsProfile.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.ProfileDetails(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    Reglage.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i11.Settings(),
          transitionsBuilder: _i12.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig('/#redirect',
            path: '/', redirectTo: '/redirection', fullMatch: true),
        _i12.RouteConfig(Connexion.name, path: '/connexion'),
        _i12.RouteConfig(Inscription.name, path: '/inscription'),
        _i12.RouteConfig(Redirection.name, path: '/redirection'),
        _i12.RouteConfig(Accueil.name, path: '/accueil'),
        _i12.RouteConfig(WaitingRoom.name, path: '/salle-d-attente'),
        _i12.RouteConfig(CreateGame.name, path: '/creer-une-partie'),
        _i12.RouteConfig(GameScreen.name, path: '/jeu'),
        _i12.RouteConfig(DetailsGame.name, path: '/details'),
        _i12.RouteConfig(Profile.name, path: '/profile/:id'),
        _i12.RouteConfig(DetailsProfile.name, path: '/profile/details/:id'),
        _i12.RouteConfig(Reglage.name, path: '/reglage')
      ];
}

/// generated route for
/// [_i1.Login]
class Connexion extends _i12.PageRouteInfo<void> {
  const Connexion() : super(Connexion.name, path: '/connexion');

  static const String name = 'Connexion';
}

/// generated route for
/// [_i2.Register]
class Inscription extends _i12.PageRouteInfo<void> {
  const Inscription() : super(Inscription.name, path: '/inscription');

  static const String name = 'Inscription';
}

/// generated route for
/// [_i3.Redirection]
class Redirection extends _i12.PageRouteInfo<void> {
  const Redirection() : super(Redirection.name, path: '/redirection');

  static const String name = 'Redirection';
}

/// generated route for
/// [_i4.Home]
class Accueil extends _i12.PageRouteInfo<void> {
  const Accueil() : super(Accueil.name, path: '/accueil');

  static const String name = 'Accueil';
}

/// generated route for
/// [_i5.Saloon]
class WaitingRoom extends _i12.PageRouteInfo<void> {
  const WaitingRoom() : super(WaitingRoom.name, path: '/salle-d-attente');

  static const String name = 'WaitingRoom';
}

/// generated route for
/// [_i6.CreateSaloon]
class CreateGame extends _i12.PageRouteInfo<void> {
  const CreateGame() : super(CreateGame.name, path: '/creer-une-partie');

  static const String name = 'CreateGame';
}

/// generated route for
/// [_i7.Game]
class GameScreen extends _i12.PageRouteInfo<void> {
  const GameScreen() : super(GameScreen.name, path: '/jeu');

  static const String name = 'GameScreen';
}

/// generated route for
/// [_i8.GameDetails]
class DetailsGame extends _i12.PageRouteInfo<void> {
  const DetailsGame() : super(DetailsGame.name, path: '/details');

  static const String name = 'DetailsGame';
}

/// generated route for
/// [_i9.Profile]
class Profile extends _i12.PageRouteInfo<void> {
  const Profile() : super(Profile.name, path: '/profile/:id');

  static const String name = 'Profile';
}

/// generated route for
/// [_i10.ProfileDetails]
class DetailsProfile extends _i12.PageRouteInfo<void> {
  const DetailsProfile()
      : super(DetailsProfile.name, path: '/profile/details/:id');

  static const String name = 'DetailsProfile';
}

/// generated route for
/// [_i11.Settings]
class Reglage extends _i12.PageRouteInfo<void> {
  const Reglage() : super(Reglage.name, path: '/reglage');

  static const String name = 'Reglage';
}
