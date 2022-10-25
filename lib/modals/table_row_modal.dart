import '../providers/table_cell_provider.dart';

 class TableRowModal {
  final String id;
  final int rowIndex;
  final int columns;
  final List<TableCellProvider> tableCells = [];

  TableRowModal({
    required this.id,
    required this.rowIndex,
    required this.columns,
  });

  void build(){
    var columnId = 1;
    for(var columnIndex = 0; columnIndex < columns; columnIndex++){
      final tableCell = TableCellProvider(id: columnId.toString(), cellIndex: [rowIndex,columnIndex], rowIndex: rowIndex, columnIndex: columnIndex);
      tableCells.add(tableCell);
      columnId++;
    }
  }
}