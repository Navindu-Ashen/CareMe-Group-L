import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/hospital_list_screen.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/patient_list_screen.dart';
import 'package:project/screens/profile_screen.dart';
import 'package:project/screens/submission_screen.dart';
import 'package:project/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userName = "Loding...";
  var vehicalNumber = "Loding...";
  var userImageUrl;
  var _isGetUserData = false;

  void _changeScreenSubmission() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SubmissionScreen(),
      ),
    );
  }

  void _changeScreenHelp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HelpScreen(),
      ),
    );
  }

  void _changeScreenPatients() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PatientList(),
      ),
    );
  }

  void _changeScreenHospitals() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HospitalListScreen(),
      ),
    );
  }

  void getuserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (!_isGetUserData) {
      setState(() {
        userName = userData.data()!["user-name"];
        vehicalNumber = userData.data()!["vehical-number"];
        userImageUrl = userData.data()!["image-url"];
      });
      _isGetUserData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getuserData();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/images/icon.png',
            width: 50,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Color.fromARGB(100, 0, 0, 0),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.primaryContainer,
                      border: Border.all(
                        color: const Color.fromARGB(200, 0, 0, 0),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (userImageUrl != null)
                          CircleAvatar(
                            backgroundImage: NetworkImage(userImageUrl!),
                            backgroundColor: Color.fromARGB(155, 136, 136, 136),
                            radius: 30,
                          ),
                        if (userImageUrl == null)
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(155, 136, 136, 136),
                            radius: 30,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: const Color.fromARGB(255, 20, 96, 165),
                              ),
                            ),
                          ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName.length > 20
                                  ? userName.substring(0, 20) + '...'
                                  : userName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              vehicalNumber,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(155, 119, 119, 119)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.grey.shade500,
                      spreadRadius: 1,
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      offset: Offset(-5, -5),
                      color: Color.fromARGB(255, 255, 255, 255),
                      spreadRadius: 1,
                      blurRadius: 8,
                    ),
                  ],
                  // shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 10,
                  ),
                  borderRadius: BorderRadius.circular(48),
                ),
                margin: EdgeInsets.symmetric(horizontal: 48),
                child: GestureDetector(
                  onTap: () {
                    _changeScreenSubmission();
                  },
                  child: Container(
                    height: 275,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 255, 88, 88),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt_1_sharp,
                          color: Colors.white,
                          size: 100,
                        ),
                        Center(
                          child: Text(
                            "NEW PATIENT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 107, 145, 196),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 10,
                              spreadRadius: -8,
                              color: Color.fromARGB(100, 0, 0, 0),
                            ),
                          ],
                        ),
                        child: Card(
                          color: const Color.fromARGB(255, 20, 96, 165),
                          child: ListTile(
                            onTap: _changeScreenPatients,
                            title: Center(
                              child: Text(
                                "Patient List",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 10,
                              spreadRadius: -8,
                              color: Color.fromARGB(100, 0, 0, 0),
                            ),
                          ],
                        ),
                        child: Card(
                          color: const Color.fromARGB(255, 20, 96, 165),
                          child: ListTile(
                            onTap: _changeScreenHospitals,
                            title: Center(
                              child: Text(
                                "Hospital List",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need some help ? ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: _changeScreenHelp,
                    child: Text(
                      'Help',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
