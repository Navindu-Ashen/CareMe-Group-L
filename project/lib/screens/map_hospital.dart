import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHospitalScreen extends StatelessWidget {
  const MapHospitalScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.hospitalName,
  });

  final double latitude;
  final double longitude;
  final String hospitalName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                latitude,
                longitude,
              ),
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: MarkerId("Hospital Location"),
                position: LatLng(
                  latitude,
                  longitude,
                ),
                infoWindow: InfoWindow(
                  title: hospitalName,
                  
                ),
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          ),
          Container(
            height: 80,
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
          ),
        ],
      ),
    );
  }
}
