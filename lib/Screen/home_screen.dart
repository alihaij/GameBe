import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'profile_screen.dart';
import 'news_screen.dart';
import 'settings_screen.dart';
import 'games_screen.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final screens = [
  const SettingsScreenPage(),
  const NewsScreen(),
  const GamesScreen(),
  const ChatScreen(),
  const ProfileScreen()
];
final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
final navigationKey = GlobalKey<CurvedNavigationBarState>();

class _HomeScreenState extends State<HomeScreen> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFF272033),
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.settings_outlined, size: 30),
            Icon(Icons.update, size: 30),
            Icon(Icons.videogame_asset_outlined, size: 30),
            Icon(Icons.supervisor_account_sharp, size: 30),
            Icon(Icons.account_circle_outlined, size: 30),
          ],
          index: index,
          color: Colors.redAccent,
          buttonBackgroundColor: Colors.redAccent,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
