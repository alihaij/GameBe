import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page_screen.dart';
import 'loading_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SettingsGroup(
              title: 'General',
              children: [
                SimpleSettingsTile(
                  title: 'Logout',
                  subtitle: '',
                  leading: const IconWidget(
                    icon: Icons.logout,
                    color: Colors.blueAccent,
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        maintainState: false,
                        builder: (context) => const LoadingScreen(),
                      ),
                    );
                  },
                ),
                SimpleSettingsTile(
                  title: 'Delete Account',
                  subtitle: '',
                  leading: const IconWidget(
                    icon: Icons.delete,
                    color: Colors.pink,
                  ),
                  onTap: () async {
                    try {
                      await FirebaseAuth.instance.currentUser!.delete();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'requires-recent-login') {
                        print(
                            'The user must reauthenticate before this operation can be executed.');
                      }
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

// Widget buildLogout() => SimpleSettingsTile(
//       title: 'Logout',
//       leading: IconsWidget(
//         icon: Icons.logout,
//       ),
//       subtitle: '',
//     ); // SimpleSettingsTile

// Widget buildLogout() => SimpleSettingsTile(
//       title: 'Logout',
//       subtitle: '',
//       leading: const IconWidget(
//         icon: Icons.logout,
//         color: Colors.blueAccent,
//       ),
//       onTap: () async {
//         await FirebaseAuth.instance.signOut();
//         Navigator.pop(context);
//       },
//     );
// SimpleSettingsTile
