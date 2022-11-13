import 'package:flutter/material.dart';

import '../modals/table_grid_modal.dart';
import '../providers/player_provider.dart';

import '../widgets/table_grid_widget.dart';
import '../widgets/player_controls_widget.dart';


class PlayFieldScreen extends StatefulWidget {
  static const routeName = '/play-field';
  const PlayFieldScreen({Key? key}) : super(key: key);

  @override
  State<PlayFieldScreen> createState() => _PlayFieldScreenState();
}

class _PlayFieldScreenState extends State<PlayFieldScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var tableGrid;
   @override
  void initState() {
    super.initState();
    final List<PlayerProvider> players= [PlayerProvider(id: '1', nickName: 'Player1',active: true),PlayerProvider(id: '2', nickName: 'Player2')];
    tableGrid = TableGridModal(id: '1', rows: 10, columns: 8, players:players);
    tableGrid.build();
  }

  @override
  void didChangeDependencies(){
     super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body:  Column(
          children: [
            TableGridWidget(tableGrid: tableGrid),
            PlayerControlsWidget(tableGrid: tableGrid)
          ],
        ),
      );
  }
}