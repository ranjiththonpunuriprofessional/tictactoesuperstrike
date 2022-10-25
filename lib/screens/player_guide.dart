import 'package:flutter/material.dart';

import '../widgets/player_guide_carousel_widget.dart';

class PlayerGuideScreen extends StatelessWidget {
  static const routeName = '/player_guide';
  const PlayerGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PlayerGuideCarouselWidget(),
    );
  }
}