import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamebe/games/chess_game.dart';
import 'Screen/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF272033),
      ),
      home: const LoadingScreen(),
      routes: {
        ChessGame.id: (context) => const ChessGame(),
      },
    );
  }
}
