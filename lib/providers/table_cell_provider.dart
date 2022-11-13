import 'package:flutter/material.dart';

class TableCellProvider with ChangeNotifier {
  final String id;
  final List<int> cellIndex;
  final int rowIndex;
  final int columnIndex;
  late bool isSelected;
  late bool filled;
  late String filledLetter;
  late bool horizontalStrike;
  late bool verticalStrike;
  late bool leftRightDiagonalStrike;
  late bool rightLeftDiagonalStrike;
  late bool striked;

  TableCellProvider({
    required this.id,
    required this.cellIndex,
    required this.rowIndex,
    required this.columnIndex,
    this.isSelected = false,
    this.filled = false,
    this.filledLetter = ' ',
    this.horizontalStrike = false,
    this.verticalStrike = false,
    this.leftRightDiagonalStrike = false,
    this.rightLeftDiagonalStrike = false,
    this.striked = false,
  });

  void fill(String letter) {
    filled = true;
    filledLetter = letter;
    notifyListeners();
  }

  void selectCell(){
     isSelected = true;
     notifyListeners();
  }

  void deselectCell(){
     isSelected = false;
     notifyListeners();
  }

  void strike(String type) {
    striked = true;
    switch (type) {
      case 'horizontal':
        horizontalStrike = true;
        break;
      case 'vertical':
        verticalStrike = true;
        break;
      case 'leftRightDiagonal':
        leftRightDiagonalStrike = true;
        break;
      case 'rightLeftDiagonal':
        rightLeftDiagonalStrike = true;
        break;
    }
    notifyListeners();
  }
}
