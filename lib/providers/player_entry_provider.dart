import 'package:flutter/material.dart'; 
import 'package:get_it/get_it.dart';


import '../firebase_services/database.dart';


class PlayerEntryProvider with ChangeNotifier {
  late String id;
  late String nickName;
  late bool state;
  late String opponentId;
  late String opponentNickName;
  late String opponentState;
  late String tableGridId;

  void updatePlayer(playerData) {
    id = playerData['id'];
    nickName = playerData['nickName'];
    state = playerData['state'];
    if(playerData['opponentNickName'] != null
      && playerData['opponentId'] != null
      && playerData['opponentState'] != null
      && playerData['tableGridId'] != null) {
        opponentId = playerData['opponentId'];
        opponentNickName = playerData['opponentNickName'];
        opponentState = playerData['opponentState'];
        tableGridId = playerData['tableGridId']; 
    }
    notifyListeners();
  }

  Future<void> createPlayer() async {
    final Database db = GetIt.I.get<Database>();
    const playerId = "playerx";
    const playerNickName = "Player X";
    const playerState = false;
    db.create({
      'id':playerId,
      'nickName':playerNickName,
      'state':playerState
    },'players');

    db.listen('players/$playerId', updatePlayer);

  }
}