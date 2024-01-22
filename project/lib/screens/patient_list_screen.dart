import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/patient_card.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  Query dbRef = FirebaseDatabase.instance.ref().child('ambulance-request-copy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Patitnt List"),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Container(
        child: FirebaseAnimatedList(
          defaultChild: Center(
            child: CircularProgressIndicator(),
          ),
          
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map patient = snapshot.value as Map;
            patient['key'] = snapshot.key;

            // Map filteredPatients = patient["patientName"] == "Navindu";

            return PatientCard(patient: patient);
          },
        ),
      ),
    );
  }
}
