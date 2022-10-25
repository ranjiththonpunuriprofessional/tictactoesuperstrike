import 'package:flutter/material.dart';
import '../widgets/splash_widget.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashWidget(),
    );
  }
}
