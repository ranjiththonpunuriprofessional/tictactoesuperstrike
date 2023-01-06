import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/player_waiting_widget.dart';
import '../providers/player_entry_provider.dart';
import './splash.dart';

class PlayerWaitingScreen extends StatelessWidget {
  static const routeName = '/player_waiting';

  final PlayerEntryProvider player = PlayerEntryProvider();

  PlayerWaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: player.createPlayer(),
        builder: (
          BuildContext ctx,
          AsyncSnapshot<Object?> snapshot,
        ) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const SplashScreen()
                : ChangeNotifierProvider.value(
                    value: player,
                    child: const PlayerWaitingWidget(),
                  ),
      ),
    );
  }
}
