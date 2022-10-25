import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/table_grid_modal.dart';
import './table_cell_widget.dart';

class TableGridWidget extends StatelessWidget {
  final TableGridModal tableGrid;

  const TableGridWidget({Key? key, required this.tableGrid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Table(
          defaultColumnWidth: const FixedColumnWidth(48),
          children: tableGrid.tableRows
              .map((tableRow) => TableRow(
                  children: tableRow.tableCells
                      .map((tableCell) => ChangeNotifierProvider.value(
                            value: tableCell,
                            child: TableCellWidget(
                              tableGrid: tableGrid,
                            ),
                          ))
                      .toList()))
              .toList(),
        ),
      ),
    );
  }
}
