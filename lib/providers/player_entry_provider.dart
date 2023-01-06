import 'package:flutter/material.dart'; 
import 'package:get_it/get_it.dart';


import '../firebase_services/database.dart';


class PlayerEntryProvider with ChangeNotifier {
  late String id;
  late String nickName;
  late bool state;
  late String opponentId;
  late String opponentNickName;
  late String tableGridId;


  PlayerEntryProvider();

  void updateOpponent() {
   
  }

  Future<void> createPlayer() async {
    final Database db = GetIt.I.get<Database>();
    const playerId = "playerx";
    const playerNickName = "Player X";
    const playerState = false;
    db.create({
      'id':playerId,
      'nickName':playerNickName,
      'playerState':playerState
    },'players');
  }

  Future<PlayerEntryProvider?> makeEntry() {
    return Future.delayed(const Duration(seconds: 2));
  }

  void updatePlayerSate(int value) {
    
  }
}