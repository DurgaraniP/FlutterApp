import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import '../../../components/already_have_an_account_acheck.dart';

const double defaultPadding = 16.0;
const kPrimaryColor = Color(0xFF6F35A5);

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    const String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/signin/';
    final Map<String, String> data = {
      'username': username,
      'password': password
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );

      if (response.statusCode == 200) {
        print('Login successful');
        print(json.decode(response.body));
      } else {
        // Handle error response
        print('Login failed with status code: ${response.statusCode}');
        print(json.decode(response.body));
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your emailAddress",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: _login, // Call the _login function on button press
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
