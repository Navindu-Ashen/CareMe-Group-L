import 'package:flutter/material.dart';
import 'package:project/screens/ambulance_list_screen.dart';
import 'package:project/screens/patient_list_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 231, 231, 231),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 107, 145, 196),
                      Color.fromARGB(255, 107, 145, 196).withOpacity(0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/images/logoTN2.png",
                      width: double.infinity, alignment: Alignment.centerLeft),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.accessible_outlined,
                          size: 30,
                          color: Color.fromARGB(255, 66, 89, 120),
                        ),
                        title: Text(
                          "Patient List",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Color.fromARGB(255, 66, 89, 120),
                                    fontSize: 24,
                                  ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => PatientList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.medical_services_rounded,
                          size: 30,
                          color: Color.fromARGB(255, 66, 89, 120),
                        ),
                        title: Text(
                          "Ambulance List",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Color.fromARGB(255, 66, 89, 120),
                                    fontSize: 24,
                                  ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => AmbulanceListScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Copyright",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.copyright,
                  size: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "2024, CareMe",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
