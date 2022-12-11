import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../modals/table_grid_modal.dart';
import './letter_selection_widget.dart';
import './player_widget.dart';

class PlayerControlsWidget extends StatelessWidget {
  final TableGridModal tableGrid;

  const PlayerControlsWidget({Key? key, required this.tableGrid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ChangeNotifierProvider.value(
                            value: tableGrid.players[0],
                            child: const PlayerWidget(),
                          ),
        LetterSelectionWidget(tableGrid: tableGrid),
        ChangeNotifierProvider.value(
                            value: tableGrid.players[1],
                            child: const PlayerWidget(),
                          )
      ],
    );
  }
}