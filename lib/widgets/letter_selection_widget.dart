import 'package:flutter/material.dart';

import '../modals/table_grid_modal.dart';

class LetterSelectionWidget extends StatelessWidget {
  final TableGridModal tableGrid;

  const LetterSelectionWidget({Key? key, required this.tableGrid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector (
                  onTap: () {
                    if(tableGrid.selectedRowIndex != -1 && tableGrid.selectedColumnIndex != -1){
                      final selectedCell = tableGrid.tableRows.elementAt(tableGrid.selectedRowIndex).tableCells.elementAt(tableGrid.selectedColumnIndex);
                      selectedCell.fill('L');
                      tableGrid.ticTacToe(selectedCell);
                      tableGrid.unsetSelectedIndexes();
                      selectedCell.deselectCell();
                      tableGrid.players[0].togglePlayer();
                      tableGrid.players[1].togglePlayer();
                    }
                  },
                  child: const Card(
                    child: Text('L'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     if(tableGrid.selectedRowIndex != -1 && tableGrid.selectedColumnIndex != -1){
                      final selectedCell = tableGrid.tableRows.elementAt(tableGrid.selectedRowIndex).tableCells.elementAt(tableGrid.selectedColumnIndex);
                      selectedCell.fill('O');
                      tableGrid.ticTacToe(selectedCell);
                      tableGrid.unsetSelectedIndexes();
                      selectedCell.deselectCell();
                      tableGrid.players[0].togglePlayer();
                      tableGrid.players[1].togglePlayer();
                    }
                  },
                  child: const Card(
                    child: Text('O'),
                  ),
                ),    
              ],
            ),
    );
     
  }

}