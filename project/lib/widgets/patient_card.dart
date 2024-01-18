import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          "Test Patient",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
