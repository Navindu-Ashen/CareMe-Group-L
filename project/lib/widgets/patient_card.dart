import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key, required this.patient});

  final Map patient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Color.fromARGB(255, 197, 197, 197),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/icon.png",
                      width: 80,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 215,
                          child: Text(
                            patient["patientName"],
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 224, 224, 224),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${patient["patientAge"]} yrs",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 224, 224, 224),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Patient State"),
                      Container(
                        width: 160,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 66, 89, 121),
                        ),
                        child: Text(
                          patient["patientState"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Ambulance Number"),
                      Container(
                        width: 180,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 66, 89, 121),
                        ),
                        child: Text(
                          patient["ambulanceNo"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Text("Pickup Location"),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: Text(
                      patient["pickupLocation"].trim().length > 50
                          ? patient["pickupLocation"].substring(0, 50) + '...'
                          : patient["pickupLocation"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
