import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                    radius: 50, backgroundImage: AssetImage('images/Ali.jpg')),
                const Text('Ali Haij',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text('FLUTTER DEVELOPER',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                      color: Colors.teal.shade100,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(color: Colors.teal.shade100),
                ),
                Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+966 568164020',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal.shade900,
                          letterSpacing: 0.5,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading: const Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'alihaij@gmail.com',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.5,
                          color: Colors.teal.shade900,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ],
            ))));
  }
}
