import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';


//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

import './firebase_services/authentication.dart';
import './firebase_services/database.dart';

import './screens/player_guide.dart';
import './screens/play_field.dart';
import './screens/player_waiting.dart';
import './screens/splash.dart';
import './screens/home.dart';
import '../firebase_services/authentication.dart';

GetIt locator = GetIt.instance;

void setupSingletons() async {
  locator.registerLazySingleton<Authentication>(() => Authentication());
  locator.registerLazySingleton<Database>(() => Database());
}

Future<void> main() async {
  setupSingletons();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Authentication auth = GetIt.I.get<Authentication>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tic Tac Toe - Super Strike',
        home: FutureBuilder(
          future:  auth.signInAnonymously(),
          builder: (ctx,snapshot) => snapshot.connectionState == ConnectionState.waiting ? const SplashScreen(): const HomeScreen()
        ),
        routes: {
          HomeScreen.routeName:(ctx) => const HomeScreen(),
          PlayerGuideScreen.routeName:(ctx) => const PlayerGuideScreen(),
          PlayFieldScreen.routeName:(ctx) => const PlayFieldScreen(),
          PlayerWaitingScreen.routeName:(ctx) => PlayerWaitingScreen(),
        },
      );
  }
}

