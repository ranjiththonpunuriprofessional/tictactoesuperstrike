import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.green,
              ),
              strokeWidth: 10,
            ),
          ],
        ),
      ),
    );
  }
}
