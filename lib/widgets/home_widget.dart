import 'package:flutter/material.dart';
import '../screens/play_field.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                 Navigator.of(context).pushReplacementNamed(PlayFieldScreen.routeName);
              }, 
              child: const Text('Play')
            ),
          ],
      ),
    );
  }
}