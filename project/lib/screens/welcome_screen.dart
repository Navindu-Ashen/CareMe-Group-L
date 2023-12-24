import 'package:flutter/material.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _changeScreenLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _changeScreenHelp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HelpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareMe"),
        backgroundColor: const Color.fromARGB(255, 189, 224, 252),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 189, 224, 252),
                Color.fromARGB(255, 249, 250, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                "assets/images/logoTN2.png",
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 107, 145, 196),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 89, 120),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                    ),
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
                width: double.infinity,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: const Color.fromARGB(255, 107, 145, 196),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _changeScreenLogin(context);
                      },
                      splashColor: Colors.white60,
                      child: const Column(
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _changeScreenHelp(context);
                      },
                      splashColor: Colors.white60,
                      child: const Column(
                        children: [
                          Icon(
                            Icons.help_outline,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "Help",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
