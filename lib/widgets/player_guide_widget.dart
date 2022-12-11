import 'package:flutter/material.dart';

import '../screens/play_field.dart';
import '../modals/player_guide_modal.dart';

class PalyerGuideWidget extends StatelessWidget {
  final PlayerGuideModal playerGuide;
  const PalyerGuideWidget({Key? key, required this.playerGuide})
      : super(key: key);

  void getStarted(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(PlayFieldScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    if (playerGuide.startHere) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(playerGuide.description),
              ElevatedButton(
                onPressed: () => getStarted(context),
                child: const Text('GET STARTED'),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(child: Text(playerGuide.description));
    }
  }
}
