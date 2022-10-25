import 'package:flutter/material.dart';
import '../modals/table_row_modal.dart';

class TableRowWidget extends StatelessWidget {
  final TableRowModal tableRow;

  const TableRowWidget({Key? key, required this.tableRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
     return const Text("Table Row");
  }
}