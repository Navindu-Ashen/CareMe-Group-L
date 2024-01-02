import 'package:flutter/material.dart';
import 'package:project/screens/profile_screen.dart';
import 'package:project/screens/submission_screen.dart';
import 'package:project/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _changeScreenSubmission(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SubmissionScreen(),
      ),
    );
  }

  void _changeScreenProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareMe"),
      ),
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 0,
          ),
          Column(
            children: [
              Text(
                "Home Screen",
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _changeScreenSubmission(context);
                },
                child: const Text("New Patient"),
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
                  onTap: () {
                    _changeScreenProfile(context);
                  },
                  splashColor: Colors.white60,
                  child: const Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      Text(
                        "Profile",
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
