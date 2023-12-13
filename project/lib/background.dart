import 'package:flutter/material.dart';
import 'package:project/help_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/welcome_page.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  var activeScreen = "welcome-screen";

  void swichScreenLogin() {
    setState(
      () {
        activeScreen = "login-screen";
      },
    );
  }

  void swichScreenWelcome() {
    setState(
      () {
        activeScreen = "welcome-screen";
      },
    );
  }

  void swichScreenHelp() {
    setState(
      () {
        activeScreen = "help-screen";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = WelcomePage(
      onLoginScreen: swichScreenLogin,
      onHelpScreen: swichScreenHelp,
    );

    if (activeScreen == "login-screen") {
      currentScreen = LoginScreen(
        onWelcomeScreen: swichScreenWelcome,
      );
    } else if (activeScreen == "welcome-screen") {
      currentScreen = WelcomePage(onLoginScreen: swichScreenLogin, onHelpScreen: swichScreenHelp,);
    } else if (activeScreen == "help-screen") {
      currentScreen = HelpScreen(onWelcomeScreen: swichScreenWelcome,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 183, 188, 243),
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
