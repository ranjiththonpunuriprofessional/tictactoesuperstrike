import 'package:flutter/material.dart';

class PlayerEntryProvider with ChangeNotifier {
  final String id;
  final String nickName;
  late bool playerState;
  late String opponentId;
  late String opponentNickName;
  late String tableGridId;

  PlayerEntryProvider({
    required this.id,
    required this.nickName,
    this.playerState = false,
  });

  void updateOpponent() {
   
  }

  Future<PlayerEntryProvider?> makeEntry() {
    return Future.delayed(const Duration(seconds: 2));
  }

  void updatePlayerSate(int value) {
    
  }
}