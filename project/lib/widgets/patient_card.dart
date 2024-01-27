import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.patientState,
    required this.ambulaneNo,
    required this.pickupLocation,
  });

  final String patientName;
  final String patientAge;
  final String patientState;
  final String ambulaneNo;
  final String pickupLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 0),
          blurRadius: 10,
          spreadRadius: -25,
          color: const Color.fromARGB(100, 0, 0, 0),
        )
      ]),
      child: Card(
        color: Color.fromARGB(255, 156, 188, 238),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 103,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleChildScrollView(
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
                              patientName,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 66, 89, 121),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "$patientAge yrs",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 66, 89, 121),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Image.asset(
                        "assets/images/icon.png",
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Patient State:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          patientState,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Ambulance No:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          ambulaneNo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Container(
                    // height: 110,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Pickup Location:",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            pickupLocation,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
