import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key, required this.onWelcomeScreen});

  final void Function() onWelcomeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Help Screen"),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: onWelcomeScreen,
            child: const Text("Back"),
          )
        ],
      ),
    );
  }
}
