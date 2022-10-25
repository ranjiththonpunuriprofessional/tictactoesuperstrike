import 'package:flutter/material.dart';
import '../data/player_guide_data.dart';
import './player_guide_widget.dart';


class PlayerGuideCarouselWidget extends StatelessWidget {
  const PlayerGuideCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: PLAYER_GUIDE_DATA.map((playerGuide) => PalyerGuideWidget(playerGuide:playerGuide)).toList(),
    );
  }
}