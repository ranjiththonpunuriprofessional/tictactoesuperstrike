import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/player_waiting_widget.dart';
import '../providers/player_entry_provider.dart';
import 'package:get_it/get_it.dart';
import './splash.dart';


class PlayerWaitingScreen extends StatelessWidget {
  static const routeName = '/player_waiting';

  final PlayerEntryProvider player = GetIt.I.get<PlayerEntryProvider>();

  PlayerWaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:  player.makeEntry(),
        builder: (ctx,snapshot) => snapshot.connectionState == ConnectionState.waiting ? const SplashScreen(): Consumer<PlayerEntryProvider>(
          builder: (BuildContext ctx, PlayerEntryProvider playerEntry, Widget? child) => PlayerWaitingWidget(playerEntry: playerEntry),
          child: const Text("Never Changes"),
        ),
      ),
    );
  }
}