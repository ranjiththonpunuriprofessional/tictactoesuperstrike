import 'package:flutter/material.dart';
import '../modals/table_grid_modal.dart';
import '../widgets/table_grid_widget.dart';

class PlayFieldScreen extends StatefulWidget {
  static const routeName = '/play-field';
  const PlayFieldScreen({Key? key}) : super(key: key);

  @override
  State<PlayFieldScreen> createState() => _PlayFieldScreenState();
}

class _PlayFieldScreenState extends State<PlayFieldScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var tableGrid;
   @override
  void initState() {
    tableGrid = TableGridModal(id: '1', rows: 10, columns: 8);
    tableGrid.build();
    super.initState();
  }

  @override
  void didChangeDependencies(){
     super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body:  TableGridWidget(tableGrid: tableGrid),
      );
  }
}