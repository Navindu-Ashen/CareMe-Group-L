import 'package:flutter/material.dart';
import 'package:project/widgets/patient_card.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Patitnt List"),
        ),
        body: Column(
          children: [
            PatientCard(),
          ],
        ));
  }
}
