import 'package:flutter/material.dart';
import 'package:gamebe/Screen/home_screen.dart';
import 'home_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gamebe/custom_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth auth = FirebaseAuth.instance;
var currentUser = FirebaseAuth.instance.currentUser;
CollectionReference users = FirebaseFirestore.instance.collection('users');
User? user = FirebaseAuth.instance.currentUser;

class LoginPage extends StatelessWidget {
  static const String id = 'login_screen';

  const LoginPage({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data.name.toString(),
          password: data.password.toString(),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return ('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          return ('Wrong password provided for that user.');
        }
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name.toString(),
          password: data.password.toString(),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return ('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          return ('The account already exists for that email.');
        }
      } catch (e) {
        return (e.toString());
      }
      return null;
    });
  }

  // Future<String?> _recoverPassword(String name) {
  //   return Future.delayed(loginTime).then((_) {
  //     if (!mockUsers.containsKey(name)) {
  //       return 'User not exists';
  //     }
  //     return null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
          primaryColor: const Color(0xFF272033),
          accentColor: Color(0xFF272033),
          titleStyle: const TextStyle(
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          )),
      initialAuthMode: AuthMode.login,
      logo: const AssetImage('images/icon1.png'),
      navigateBackAfterRecovery: true,
      loginAfterSignUp: false,
      loginProviders: [
        LoginProvider(
          button: Buttons.GoogleDark,
          label: 'Sign in with Google',
          callback: () async {
            return null;
          },
          providerNeedsSignUpCallback: () {
            // put here your logic to conditionally show the additional fields
            return Future.value(true);
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebook,
          label: 'Facebook',
          callback: () async {
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.twitter,
          label: 'Twitter',
          callback: () async {
            return null;
          },
        ),
      ],
      termsOfService: [
        TermOfService(
            id: 'newsletter',
            mandatory: false,
            text: 'Newsletter subscription'),
        TermOfService(
          id: 'general-term',
          mandatory: true,
          text: 'Term of services',
          linkUrl: 'https://twitter.com/A3Haij',
        ),
      ],
      additionalSignupFields: [
        UserFormField(
          keyName: 'Username',
          fieldValidator: (value) {
            if (value == 'omk') {
              return 'Username already exists';
            }
            if (value == 'loloucho') {
              return 'Username already exists';
            }
            if (value == 'ali') {
              return 'Username already exists';
            }
            FirebaseFirestore.instance
                .collection('users')
                .add({'user_name': value});
            return null;
          },
        )
      ],
      // initialAuthMode: AuthMode.login,
      userValidator: (value) {
        if (!value!.contains('@')) {
          return "Email must contain '@' ";
        }

        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        if (value.length < 7) {
          return 'Passwords should have a minimum of 7 characters';
        }
        return null;
      },
      onLogin: (loginData) {
        debugPrint('Login info');
        debugPrint('Name: ${loginData.name}');
        debugPrint('Password: ${loginData.password}');

        return _loginUser(loginData);
      },
      onSignup: (signupData) {
        // signupData.additionalSignupData?.forEach((key, value) {
        //   debugPrint('$key: $value');
        // });
        if (signupData.termsOfService.isNotEmpty) {
          debugPrint('Terms of service: ');
          for (var element in signupData.termsOfService) {
            debugPrint(
                ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
          }
        }
        return _signupUser(signupData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      onRecoverPassword: (name) {
        debugPrint('Recover password info');
        debugPrint('Name: $name');
        // return _recoverPassword(name);
        // Show new password dialog
      },
      // showDebugButtons: true,
    );
  }
}

const mockUsers = {
  'a3haij@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  'near.huscarl@gmail.com': 'subscribe to pewdiepie',
  '@.com': '.',
};
