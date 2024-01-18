import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/screens/submission_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    Widget mapContent = Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 8,
                  color: Colors.black54),
            ],
          ),
          height: 620,
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(latitudeFinal, longitudeFinal),
                zoom: 16,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("A"),
                  position: LatLng(latitudeFinal, longitudeFinal),
                ),
              }),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 255, 255),
                const Color.fromARGB(255, 255, 255, 255),
                const Color.fromARGB(0, 255, 255, 255)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
    // if (longitudeFinal == 0 && latitudeFinal == 0) {
    //   mapContent = Center(
    //     child: Text("Somthing Went Wrong"),
    //   );
    // }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // appBar: AppBar(
      //   // title: Text("Hospital Direction"),
      //   backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          mapContent,
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Text(
                    "Selected Hospital: ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 200, 200, 200),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "National Hospital Sri Lanka",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Text(
                    "Time estimated: ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 200, 200, 200),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "10 Min",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
