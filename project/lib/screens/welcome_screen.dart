import 'package:flutter/material.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _changeScreenLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void _changeScreenHelp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HelpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareMe"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logoTN.png",
              width: 250,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 107, 145, 196),
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 89, 120),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10)),
                  onPressed: () {
                    _changeScreenLogin(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  )),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              "assets/images/home-image.jpg",
              width: 300,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: const Color.fromARGB(255, 66, 89, 120),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _changeScreenLogin(context);
                    },
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 40,
                    ),
                    label: const Text("Login"),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      _changeScreenHelp(context);
                    },
                    icon: const Icon(
                      Icons.help_outline,
                      size: 40,
                    ),
                    label: const Text("Help"),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            // Text(
            //   "Welcome Screen",
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Theme.of(context).colorScheme.secondary,
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     _changeScreenLogin(context);
            //   },
            //   child: const Text("Login"),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     _changeScreenHelp(context);
            //   },
            //   child: const Text("Help"),
            // ),
          ],
        ),
      ),
    );
  }
}
