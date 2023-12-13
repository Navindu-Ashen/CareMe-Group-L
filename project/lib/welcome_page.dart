import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.onLoginScreen, required this.onHelpScreen});

  final void Function() onLoginScreen;
  final void Function() onHelpScreen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                onPressed: onLoginScreen,
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
            width: double.infinity,
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
                  onPressed: onLoginScreen,
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
                  onPressed: onHelpScreen,
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
          )
        ],
      ),
    );
  }
}
