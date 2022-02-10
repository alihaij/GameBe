import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gamebe/Screen/login_page_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  // color: const Color(0xFF272033),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF272033),
                Color(0xFF272030),
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('images/icon1.png'),
                    height: 300,
                    width: 300,
                  ),
                ),
                Center(
                  child: Text(
                    'TO BE OR NOT TO BE',
                    style: TextStyle(
                        fontFamily: 'AlfaSlabOne',
                        fontSize: 30,
                        color: Colors.redAccent),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
