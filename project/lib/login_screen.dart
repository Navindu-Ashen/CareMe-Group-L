import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onWelcomeScreen});

  final void Function() onWelcomeScreen;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void backWelcomeScreen() {
    widget.onWelcomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/logoTN.png",
          width: 250,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 107, 145, 196),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 183, 188, 243),
                  ),
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 32, right: 16, left: 16),
                  child: const Column(
                    children: [
                      TextField(
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: Text("User Name"),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("Password"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 89, 120),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10)),
                  onPressed: backWelcomeScreen,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          "assets/images/home-image.jpg",
          width: 250,
        ),
        Container(
          color: const Color.fromARGB(255, 66, 89, 120),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {},
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
                onPressed: () {},
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
    );
  }
}
