import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/patient_card.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Patitnt List"),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("patients")
            .orderBy(
              "pickupTime",
              descending: true,
            )
            .snapshots(),
        builder: (cxt, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Patients yet"),
            );
          }

          if (chatSnapshot.hasError) {
            return const Center(
              child: Text("Somthing went wrong"),
            );
          }

          final loadedData = chatSnapshot.data!.docs;

          return ListView.builder(
            reverse: false,
            itemCount: loadedData.length,
            itemBuilder: (context, index) {
              final currentData = loadedData[index].data();

              return PatientCard(
                patientName: currentData["patientName"],
                patientAge: currentData["patientAge"],
                patientState: currentData["patientState"],
                ambulaneNo: currentData["ambulanceNo"],
                pickupLocation: currentData["pickupLocation"],
              );
            },
          );
        },
      ),
    );
  }
}
