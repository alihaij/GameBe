import 'package:flutter/material.dart';
import 'package:gamebe/Screen/main_screen.dart';
import 'main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272033),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage('images/icon1.png'),
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'SIGN IN',
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'AlfaSlabOne',
              color: Colors.red,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          ButtonTheme(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text('Sign In')),
          )
        ],
      ),
    );
  }
}
