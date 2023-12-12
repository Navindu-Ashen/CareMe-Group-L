import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onWelcomeScreen});

  final void Function() onWelcomeScreen;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void backWelcomeScreen(){
    widget.onWelcomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login Screen"),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: backWelcomeScreen,
            child: const Text("Back"),
          )
        ],
      ),
    );
  }
}
