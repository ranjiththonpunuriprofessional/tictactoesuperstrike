
import './table_row_modal.dart';
import '../providers/player_provider.dart';

class TableGridModal {
  final String id;
  final int rows;
  final int columns;
  final List<TableRowModal> tableRows = [];
  final List<PlayerProvider> players;
  late int selectedRowIndex = -1;
  late int selectedColumnIndex = -1; 

  TableGridModal({
    required this.id,
    required this.rows,
    required this.columns,
    required this.players,
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

  void setSelectedIndexes(int rowIndex, int columnIndex){
      selectedRowIndex = rowIndex;
      selectedColumnIndex = columnIndex;
  }

  void unsetSelectedIndexes(){
    if(selectedRowIndex != -1 && selectedColumnIndex != -1){
      tableRows.elementAt(selectedRowIndex).tableCells.elementAt(selectedColumnIndex).deselectCell();
    }
    selectedRowIndex = -1;
    selectedColumnIndex = -1;
  }

  void ticTacToe(currentCell, {int value = 0}) {
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
        if(players[0].active){
          players[0].updateScore(value);
        } 
        if(players[1].active){
          players[1].updateScore(value);
        }
    } 
    if (currentCell.filledLetter == "L") { 
        if(leftCell?.filledLetter == "O"){
           ticTacToe(leftCell);
        }
        if(rightCell?.filledLetter == "O"){
           ticTacToe(rightCell, value:value);
        }
        if(topCell?.filledLetter == "O"){
           ticTacToe(topCell, value:value);
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
