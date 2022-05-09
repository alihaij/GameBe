import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page_screen.dart';
import 'loading_screen.dart';

class SettingsScreenPage extends StatelessWidget {
  static const String id = 'settings_screen';
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyDarkMode = 'key-dark--mode';
  static const keyPassword = 'key-password';

  const SettingsScreenPage({Key? key}) : super(key: key);

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
            SwitchSettingsTile(
              settingKey: keyDarkMode,
              leading: const IconWidget(
                icon: Icons.dark_mode,
                color: Color(0xFF642ef3),
              ), // IconWidget
              title: 'Dark Mode',
              onChange: (_) {},
            ), // SwitchSettingsTile
            SettingsGroup(
              title: 'General',
              children: [
                SimpleSettingsTile(
                  title: 'Account Settings',
                  subtitle: 'Privacy, security, Language ',
                  leading: const IconWidget(
                    icon: Icons.person,
                    color: Colors.green,
                  ),
                  child: SettingsScreen(
                    title: 'Account Settings',
                    children: [
                      DropDownSettingsTile(
                        settingKey: keyLanguage,
                        title: 'language',
                        selected: 1,
                        values: const <int, String>{
                          1: 'English',
                          2: 'عربي',
                          3: '中文',
                        },
                      ),
                      TextInputSettingsTile(
                        settingKey: keyLocation,
                        title: 'Location',
                        initialValue: 'Jeddah',
                        // onChange: {},
                      ),
                      TextInputSettingsTile(
                          settingKey: keyPassword,
                          title: 'Password',
                          obscureText: true,
                          validator: (password) =>
                              password != null && password.length >= 6
                                  ? null
                                  : 'Enter6characters'

                          // onChange: {},
                          ),
                      SimpleSettingsTile(
                        title: 'Privacy',
                        subtitle: '',
                        leading: const IconWidget(
                          icon: Icons.lock,
                          color: Colors.blueAccent,
                        ),
                        onTap: () {},
                      ),
                      SimpleSettingsTile(
                        title: 'Security',
                        subtitle: '',
                        leading: const IconWidget(
                          icon: Icons.security,
                          color: Colors.red,
                        ),
                        onTap: () {},
                      ),
                      SimpleSettingsTile(
                        title: 'Account info',
                        subtitle: '',
                        leading: const IconWidget(
                          icon: Icons.text_snippet,
                          color: Colors.purple,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
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
            ),
            const SizedBox(height: 32),
            SettingsGroup(
              title: "FEEDBACK",
              children: [
                SimpleSettingsTile(
                  title: 'Report A Bug',
                  subtitle: '',
                  leading: const IconWidget(
                    icon: Icons.bug_report,
                    color: Colors.teal,
                  ),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'Send Feedback',
                  subtitle: '',
                  leading: const IconWidget(
                    icon: Icons.thumb_up,
                    color: Colors.purple,
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
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
//         try {
//           await FirebaseAuth.instance.currentUser!.delete();
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'requires-recent-login') {
//             print(
//                 'The user must reauthenticate before this operation can be executed.');
//           }
//         }
//       },
//     );
// SimpleSettingsTile
