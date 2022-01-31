import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamebe/Screen/login_page_screen.dart';
import 'Screen/login_page_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272033),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Hero(
                      tag: 'icon',
                      child: Image(image: AssetImage('images/icon1.png'))),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'TO B OR NOT TO B',
              style: TextStyle(
                  color: Colors.redAccent.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
