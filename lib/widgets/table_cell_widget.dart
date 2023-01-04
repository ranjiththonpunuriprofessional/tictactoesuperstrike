import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/table_cell_provider.dart';
import '../modals/table_grid_modal.dart';
class TableCellWidget extends StatelessWidget {
  final TableGridModal tableGrid;

  const TableCellWidget({Key? key, required this.tableGrid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TableCellProvider>(
      builder: (BuildContext ctx, TableCellProvider tableCell, Widget? child) => GestureDetector(
        onTap: () {
          if(tableCell.filled != true){
            tableGrid.unsetSelectedIndexes();
            tableCell.selectCell();
            tableGrid.setSelectedIndexes(tableCell.rowIndex, tableCell.columnIndex);
          }
        },
        child: SizedBox(
          height: 48,
          child: Card(
            color: tableCell.striked ? Colors.green : tableCell.filled ? Colors.orange : tableCell.isSelected ? Colors.yellowAccent: Colors.white,
            margin: const EdgeInsets.all(1),
            child: Center(
              child: Text(
                tableCell.filledLetter,
              ),
            ),
          ),
        ),
      ),
      child: const Text("Never Changes"),
    );
  }
}
