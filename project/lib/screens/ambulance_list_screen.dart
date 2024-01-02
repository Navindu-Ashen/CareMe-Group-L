import 'package:flutter/material.dart';

class AmbulanceListScreen extends StatelessWidget {
  const AmbulanceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ambulance List"),
      ),
      body: Center(
        child: Text(
          "Ambulance List",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}