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
                            onPressed: () {},
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
