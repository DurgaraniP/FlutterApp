import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const double defaultPadding = 16.0;
const kPrimaryColor =
Color(0xFF6F35A5);

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    const String apiUrl = 'http://127.0.0.1:8000/doctdrive_app/signup/';
    final Map<String, String> data = {
      'username': username,
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );

      if (response.statusCode == 200) {
        print('Sign-up successful');
        print(json.decode(response.body));
      } else {
        // Handle error response
        print('Sign-up failed with status code: ${response.statusCode}');
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Username",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Email Address",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
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
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: _signUp, // Call the _signUp function on button press
            child: Text(
              "Sign Up".toUpperCase(),
            ),
          ),
          // Other widgets or components as needed for sign-up screen
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
