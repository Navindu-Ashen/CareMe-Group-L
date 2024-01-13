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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logoTN2.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_taxi,
                      size: 24,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Driver_Number Ambulance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'New Patient',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 5),
              
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
            ]
            ),
      ),
    );
  }
}
