import 'package:flutter/material.dart';

class Uno extends StatelessWidget {
  static const String id = 'uno_game';
  const Uno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uno'),
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
