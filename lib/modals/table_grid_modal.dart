
import './table_row_modal.dart';
import '../providers/player_provider.dart';

class TableGridModal {
  final String id;
  final int rows;
  final int columns;
  final List<TableRowModal> tableRows = [];
  late PlayerProvider leftPlayer;
  late PlayerProvider rightPlayer;

  TableGridModal({
    required this.id,
    required this.rows,
    required this.columns,
    leftPlayer = null,
    rightPlayer = null,
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

  int ticTacToe(currentCell, {int value = 0}) {
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
              value++;
        }
        if (topCell?.filledLetter == 'L' && 
            bottomCell?.filledLetter == 'L') {
              topCell?.strike('vertical');
              currentCell.strike('vertical');
              bottomCell?.strike('vertical');
              value++;
        }
        if(topLeftCell?.filledLetter == 'L' && 
           bottomRightCell?.filledLetter == 'L' ){
            topLeftCell?.strike('leftRightDiagonal');
            currentCell.strike('leftRightDiagonal');
            bottomRightCell?.strike('leftRightDiagonal');
            value++;
        }
        if(topRightCell?.filledLetter == 'L' && 
           bottomLeftCell?.filledLetter == 'L' ){
            topRightCell?.strike('rightLeftDiagonal');
            currentCell.strike('rightLeftDiagonal');
            bottomLeftCell?.strike('rightLeftDiagonal');
            value++;
        }
    } 
    if (currentCell.filledLetter == "L") { 
        if(leftCell?.filledLetter == "O"){
           value = ticTacToe(leftCell, value:value);
        }
        if(rightCell?.filledLetter == "O"){
           value = ticTacToe(rightCell, value:value);
        }
        if(topCell?.filledLetter == "O"){
           value = ticTacToe(topCell, value:value);
        }
        if(bottomCell?.filledLetter == "O"){
           value = ticTacToe(bottomCell, value:value);
        }
        if(topLeftCell?.filledLetter == "O"){
           value = ticTacToe(topLeftCell, value:value);
        }
        if(bottomRightCell?.filledLetter == "O"){
           value = ticTacToe(bottomRightCell, value:value);
        }
        if(topRightCell?.filledLetter == "O"){
           value = ticTacToe(topRightCell, value:value);
        }
        if(bottomLeftCell?.filledLetter == "O"){
           value = ticTacToe(bottomLeftCell, value:value);
        }
    }
    // if(leftPlayer.active){
    //   leftPlayer.updateScore(value);
    // } 
    // if(rightPlayer.active){
    //   rightPlayer.updateScore(value);
    // }

    return value;
  } 
}
