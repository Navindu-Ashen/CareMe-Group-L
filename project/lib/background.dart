import 'package:flutter/material.dart';
import 'package:project/welcome_page.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    Widget currentScreen = const WelcomePage();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 208, 215, 250),
                Color.fromARGB(255, 249, 250, 255),
                Color.fromARGB(255, 249, 250, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
