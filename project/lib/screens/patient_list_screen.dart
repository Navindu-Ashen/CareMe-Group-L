import 'package:flutter/material.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patitnt List"),
      ),
      body: Center(
        child: Text(
          "Patient List",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
