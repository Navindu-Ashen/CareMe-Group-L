import 'package:flutter/material.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
      // appBar: AppBar(
      //   title: Text("CareMe", style: Theme.of(context).textTheme.titleLarge,),
      //   backgroundColor: Color.fromARGB(255, 151, 196, 255),
      // ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 189, 224, 252),
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
                height: 55,
              ),
              Image.asset(
                "assets/images/logoTN2.png",
                width: 200,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Stack(
                children: [
                  Container(
                    height: 450,
                    child: Align(
                      // heightFactor: 1.8,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/home-image.jpg",
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 50,
                    right: 50,
                    child: InkWell(
                      onTap: (){
                        _changeScreenLogin(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 107, 145, 196),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(15, 15),
                              color: const Color.fromARGB(255, 192, 192, 192),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-15, -15),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 66, 89, 120),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 20,
                              ),
                              shadowColor: Colors.white,
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
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: const Color.fromARGB(255, 107, 145, 196),
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                            size: 40,
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
                            size: 40,
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
