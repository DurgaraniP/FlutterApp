//import 'package:emojis/emoji.dart';
//import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          },
          child: Text(
            "Login".toUpperCase(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryLightColor,
            elevation: 0,
          ),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const Text(
          "                              ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "                              ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "                              ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'With Love for Doctors \u2764\uFE0F',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
