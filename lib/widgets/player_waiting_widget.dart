import 'package:flutter/material.dart';
import 'package:tictactoesuperstrike/providers/player_entry_provider.dart';




class PlayerWaitingWidget extends StatelessWidget {
  final PlayerEntryProvider playerEntry;
  const PlayerWaitingWidget({Key? key, required this.playerEntry}) : super(key: key);

  void didUpdateWidget(covariant Tab oldWidget) { 
    
  }
  @override
  Widget build(BuildContext context) {
    return const Text('waiting');
  }
}