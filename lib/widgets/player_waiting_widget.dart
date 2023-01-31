import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/player_entry_provider.dart';




class PlayerWaitingWidget extends StatelessWidget {
  const PlayerWaitingWidget({Key? key}) : super(key: key);

  void didUpdateWidget(covariant Tab oldWidget) { 
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerEntryProvider>(
      builder: (BuildContext ctx, PlayerEntryProvider player, Widget? child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                child: Text(player.id),
              ),
              Card(
                child: Text(player.nickName),
              ),    
            ],
          ),
      child: const Text("Never Changes"),
    );
  }
}