import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _changeScreenHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareMe Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 25,
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
                    height: 500,
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
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 180),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 107, 145, 196),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset(15, 15),
                              color: Color.fromARGB(155, 0, 0, 0),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-15, -15),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextField(
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
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: const Color.fromARGB(255, 107, 145, 196),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.white60,
                  child: const Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
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
    );
  }
}
