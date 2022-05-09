import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamebe/Screen/settings_screen.dart';
import 'package:gamebe/games/chess_game.dart';
import 'Screen/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final isDarkMode =
    //     Settings.getValue<bool>(SettingsScreenPage.keyDarkMode, true);
    return ValueChangeObserver<bool>(
      cacheKey: SettingsScreenPage.keyDarkMode,
      defaultValue: true,
      builder: (_, isDarkMode, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDarkMode
            ? ThemeData.dark().copyWith(
                brightness: Brightness.dark,
                primaryColor: const Color(0xFF272033),
                accentColor: Colors.white,
                scaffoldBackgroundColor: const Color(0xFF170635),
                canvasColor: const Color(0xFF170635),
              )
            : ThemeData.light().copyWith(accentColor: Colors.black),
        home: const LoadingScreen(),
        routes: {
          ChessGame.id: (context) => const ChessGame(),
        },
      ),
    );
  }
}
