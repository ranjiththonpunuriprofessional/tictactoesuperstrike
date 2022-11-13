import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/player_provider.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (BuildContext ctx, PlayerProvider player, Widget? child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                child: Text(player.score.toString()),
              ),
              Card(
                color: player.active ? Colors.purple : Colors.white,
                child: Text(player.id),
              ),    
            ],
          ),
      child: const Text("Never Changes"),
    );
  }

}