import 'package:flutter/material.dart';
import 'package:project/screens/hospital_list_screen.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/patient_list_screen.dart';
import 'package:project/screens/submission_screen.dart';
import 'package:project/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _changeScreenSubmission() {
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

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.asset(
            //   'assets/images/icon.png',
            //   width: 80,
            // ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.medical_services_outlined,
                      size: 40,
                      color: Color.fromARGB(255, 255, 60, 60),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ambulance_Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ambulance',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(155, 136, 136, 136)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(155, 136, 136, 136),
                      radius: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    color: Color.fromARGB(155, 64, 64, 64),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 5,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  _changeScreenSubmission();
                },
                child: Container(
                  height: 275,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 88, 88),
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
            SizedBox(height: 40),
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
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
