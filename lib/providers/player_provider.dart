import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  final String id;
  final String nickName;
  late int score;
  late bool active;

  PlayerProvider({
    required this.id,
    required this.nickName,
    this.score = 0,
    this.active = false,
  });

  void togglePlayer () {
    active = active ? false: true;
    notifyListeners();
  }

  void updateScore(int value) {
    score = score + value;
    notifyListeners();
  }
}