import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/hospital_card.dart';

class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({super.key});

  @override
  State<HospitalListScreen> createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  var hospitalName;
  var imageUrl;
  double lat = 0;
  double lon = 0;

  void _getHospitalData() async {
    final hospitalData = await FirebaseFirestore.instance
        .collection("hospitals")
        .doc("hospital1")
        .get();
    setState(() {
      hospitalName = hospitalData.data()!["hospitalName"];
      imageUrl = hospitalData.data()!["imageUrl"];
      lat = hospitalData.data()!["latitude"];
      lon = hospitalData.data()!["longitude"];
    });
    
  }

  @override
  Widget build(BuildContext context) { 
    if(hospitalName == null){
      _getHospitalData();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Hospital List"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Column(
          children: [
            HospitalCard(
              hospitalName: hospitalName,
              imageUrl: imageUrl,
              latitude: lat,
              longitude: lon,
            ),
          ],
        ));
  }
}
