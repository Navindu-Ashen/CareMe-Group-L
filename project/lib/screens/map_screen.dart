import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/direction-data/directions_model.dart';
import 'package:project/direction-data/directions_repository.dart';
import 'package:project/screens/submission_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    required this.hospitalName,
    required this.hospitalLat,
    required this.hospitalLon,
  });

  final String hospitalName;
  final double hospitalLat;
  final double hospitalLon;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _googleMapController;
  Directions? _info;
  var _isGetRoute = false;

  void getRoute() async {
    final directions = await DirectionsRepository().getDirections(
      origin: LatLng(latitudeFinal, longitudeFinal),
      destination: LatLng(widget.hospitalLat, widget.hospitalLon),
    );
    _info = directions;
    if (_info == null) {
      getRoute();
    }
    setState(() {
      _isGetRoute = true;
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isGetRoute) {
      getRoute();
    }

    // getRoute();
    print(widget.hospitalName + ".........................................");
    print(widget.hospitalLat);
    print(widget.hospitalLon);

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
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitudeFinal, longitudeFinal),
              zoom: 14,
            ),
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              Marker(
                markerId: MarkerId("currentLocation"),
                position: LatLng(latitudeFinal, longitudeFinal),
                infoWindow: InfoWindow(title: "Pickup location"),
              ),
              Marker(
                markerId: MarkerId("hospitalLocation"),
                position: LatLng(widget.hospitalLat, widget.hospitalLon),
                infoWindow: InfoWindow(title: widget.hospitalName),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('overview_polyline'),
                color: Colors.red,
                width: 5,
                points: _info!.polylinePoints
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList(),
              ),
            },
          ),
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
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(latitudeFinal, longitudeFinal),
                  zoom: 14,
                ),
              ),
            ),
            child: Icon(
              Icons.location_on_rounded,
              size: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          right: 16,
          child: FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(widget.hospitalLat, widget.hospitalLon),
                  zoom: 14,
                ),
              ),
            ),
            child: Icon(
              Icons.medical_services_rounded,
              size: 30,
            ),
          ),
        ),
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
                    widget.hospitalName,
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
                    "Total distance and duration:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 200, 200, 200),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_info!.totalDistance}, ${_info!.totalDuration}',
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
