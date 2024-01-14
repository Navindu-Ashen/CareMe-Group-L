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
        // title: const Text("CareMe"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logoTN2.png',
              width: 180,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
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
                      size: 50,
                      color: const Color.fromARGB(255, 255, 102, 102),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ambulance_Number',
                          style: TextStyle(
                            fontSize: 18,
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
                      backgroundColor: const Color.fromARGB(255, 255, 102, 102),
                      radius: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // offset: Offset(5, 5),
                    color: Color.fromARGB(155, 0, 0, 0),
                    blurRadius: 25,
                  ),
                ],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 8,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  _changeScreenSubmission();
                },
                child: CircleAvatar(
                  child: Center(
                    child: Text(
                      "New \n Patient",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 102, 102),
                  radius: 140,
                ),
              ),
            ),
            SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
