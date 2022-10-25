
import 'table_row_modal.dart';

class TableGridModal {
  final String id;
  final int rows;
  final int columns;
  final List<TableRowModal> tableRows = [];

  TableGridModal({
    required this.id,
    required this.rows,
    required this.columns,
  });

  void build(){
    var rowId = 1;
    for(var rowindex = 0; rowindex < rows; rowindex++){
      final tableRow = TableRowModal(id: rowId.toString(), rowIndex: rowindex, columns: columns);
      tableRow.build();
      tableRows.add(tableRow);
      rowId++;
    }
  }

  void ticTacToe(currentCell) {
    var leftColumnIndex = currentCell.columnIndex - 1;
    var rightColumnIndex = currentCell.columnIndex + 1;
    var topRowIndex = currentCell.rowIndex - 1;
    var bottomRowIndex =  currentCell.rowIndex + 1;

    var validLeftColumnIndex = leftColumnIndex >= 0;
    var validRightColumnIndex = rightColumnIndex < columns;
    var validTopRowIndex = topRowIndex >= 0;
    var validBottomRowIndex  = bottomRowIndex < rows;

    var leftCell = validLeftColumnIndex ? tableRows.elementAt(currentCell.rowIndex).tableCells.elementAt(leftColumnIndex): null;
    var rightCell = validRightColumnIndex ? tableRows.elementAt(currentCell.rowIndex).tableCells.elementAt(rightColumnIndex): null;
    var topCell = validTopRowIndex ? tableRows.elementAt(topRowIndex).tableCells.elementAt(currentCell.columnIndex) : null;
    var bottomCell = validBottomRowIndex ? tableRows.elementAt(bottomRowIndex).tableCells.elementAt(currentCell.columnIndex): null;

    var  topLeftCell = validTopRowIndex &&  validLeftColumnIndex ? tableRows.elementAt(topRowIndex).tableCells.elementAt(leftColumnIndex): null;
    var  bottomLeftCell =  validBottomRowIndex && validLeftColumnIndex ? tableRows.elementAt(bottomRowIndex).tableCells.elementAt(leftColumnIndex): null;
    var  topRightCell =  validTopRowIndex && validRightColumnIndex ? tableRows.elementAt(topRowIndex).tableCells.elementAt(rightColumnIndex): null;
    var  bottomRightCell =  validBottomRowIndex && validRightColumnIndex ? tableRows.elementAt(bottomRowIndex).tableCells.elementAt(rightColumnIndex): null;
    
    if (currentCell.filledLetter == "O") {
        if (leftCell?.filledLetter == 'L' && 
            rightCell?.filledLetter == 'L') {
              leftCell?.strike('horizontal');
              currentCell.strike('horizontal');
              rightCell?.strike('horizontal');
        }
        if (topCell?.filledLetter == 'L' && 
            bottomCell?.filledLetter == 'L') {
              topCell?.strike('vertical');
              currentCell.strike('vertical');
              bottomCell?.strike('vertical');
        }
        if(topLeftCell?.filledLetter == 'L' && 
           bottomRightCell?.filledLetter == 'L' ){
            topLeftCell?.strike('leftRightDiagonal');
            currentCell.strike('leftRightDiagonal');
            bottomRightCell?.strike('leftRightDiagonal');
        }
        if(topRightCell?.filledLetter == 'L' && 
           bottomLeftCell?.filledLetter == 'L' ){
            topRightCell?.strike('rightLeftDiagonal');
            currentCell.strike('rightLeftDiagonal');
            bottomLeftCell?.strike('rightLeftDiagonal');
        }
    } 
    if (currentCell.filledLetter == "L") { 
        if(leftCell?.filledLetter == "O"){
           ticTacToe(leftCell);
        }
        if(rightCell?.filledLetter == "O"){
           ticTacToe(rightCell);
        }
        if(topCell?.filledLetter == "O"){
           ticTacToe(topCell);
        }
        if(bottomCell?.filledLetter == "O"){
           ticTacToe(bottomCell);
        }
        if(topLeftCell?.filledLetter == "O"){
           ticTacToe(topLeftCell);
        }
        if(bottomRightCell?.filledLetter == "O"){
           ticTacToe(bottomRightCell);
        }
        if(topRightCell?.filledLetter == "O"){
           ticTacToe(topRightCell);
        }
        if(bottomLeftCell?.filledLetter == "O"){
           ticTacToe(bottomLeftCell);
        }
    }
  } 
}
