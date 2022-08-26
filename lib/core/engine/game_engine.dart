
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gabo/core/app_user.dart';
import 'package:gabo/core/card_list.dart';
import 'package:gabo/core/game_model.dart';
import 'package:gabo/core/services/game_users_services.dart';
import 'package:gabo/core/smooth_card_model.dart';

class GameEngine with ChangeNotifier{

  List<SmoothCardModel> deck = [];
  List<AppUser> players = [];

  void init(GameModel game){
    initDeck();
    initGame(game);
    notifyListeners();
  }

  void initDeck() {
    deck = gameCards;
    print("Deck initialized !");
    notifyListeners();
  }

  void initGame(GameModel game) {
    GameUsersServices().getAllParticipantsByGameUid(game.uid)?.listen((users) {
      initPlayers(users);
      notifyListeners();
    });
  }

  void initPlayers(List<AppUser> users) {
    players = users;
    if(players.isNotEmpty){
      print("Players initialized !");
    }else{
      print("Players list not initialized !");
    }
  }

  void shuffleDeck(){
    deck.shuffle();
    notifyListeners();
  }

  SmoothCardModel getCardFromCurrentDeck(){
    int getRand = getNextRandomInt();
    final card = deck[getRand];
    deck.remove(card);
    return card;
  }

  int getNextRandomInt() => Random().nextInt(52);

  List<SmoothCardModel> distributeCard(){
    List<SmoothCardModel> temp = [];
    for(int i = 0; i <= deck.length; i++){
      final rand1 = getNextRandomInt();
      final rand2 = getNextRandomInt();

      for (int j = (rand1 < rand2 ? rand1 : rand2); j <= (rand1 < rand2 ? rand2 : rand1); j++) {
        final card = getCardFromCurrentDeck();
        temp.add(card);
      }
    }
    print("Player cards : ${temp.length}");
    return temp;
  }

  void piocher(AppUser player){

  }

}