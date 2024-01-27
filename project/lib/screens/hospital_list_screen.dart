import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/hospital_card.dart';

class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({super.key});

  @override
  State<HospitalListScreen> createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Hospital List"),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("hospitals").snapshots(),
        builder: (cxt, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Hospitals added"),
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

              return HospitalCard(
                hospitalName: currentData["hospitalName"],
                imageUrl: currentData["imageUrl"],
                latitude: currentData["latitude"],
                longitude: currentData["longitude"],
              );
            },
          );
        },
      ),
    );
  }
}
