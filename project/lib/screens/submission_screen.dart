import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project/direction-data/directions_model.dart';
import 'package:project/direction-data/directions_repository.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/results_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/patient_data.dart';

const uuid = Uuid();
double latitudeFinal = 0;
double longitudeFinal = 0;

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  final _form = GlobalKey<FormState>();

  String dropdownValueGender = "Male";
  String dropdownValueState = 'Normal';
  var _isSending = false;
  var _pName = "";
  var _pAge = "";
  var _pDescription = "Not available";
  // var _travelTime = "";
  var _pickedLocation;
  var _isGettingLocation = false;
  var _isLocationSet = false;
  var _isHandedOver = false;
  late Directions _info;

  var hospitalName;
  double hospitalLat = 0;
  double hospitalLon = 0;

  String get locationImage {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitudeFinal, $longitudeFinal&zoom=17&size=600x300&maptype=roadmap&markers=color:red%7Clabel:P%7C$latitudeFinal,$longitudeFinal&key=AIzaSyAcKZHMOpRIqKUPAAP1U-n8Vp6nEtg7pcs";
  }

  void _changeScreenHelp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => HelpScreen(),
      ),
    );
  }

  void _saveItem() async {
    var _rollNumber = uuid.v4();

    if (_form.currentState!.validate()) {
      if (!_isLocationSet) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please set the location")),
        );
        return;
      }

      FocusScope.of(context).unfocus();
      _form.currentState!.save();

      setState(() {
        _isSending = true;
      });

      print(
          "Saveing successs........................................................");

      final user = FirebaseAuth.instance.currentUser!;
      final userData = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      print(
          "Get user data success...................................................");

      final hospitalData = await FirebaseFirestore.instance
          .collection("hospitals")
          .doc("hospital1")
          .get();
      hospitalName = hospitalData.data()!["hospitalName"];
      hospitalLat = hospitalData.data()!["latitude"];
      hospitalLon = hospitalData.data()!["longitude"];

      final directions = await DirectionsRepository().getDirections(
        origin: LatLng(latitudeFinal, longitudeFinal),
        destination: LatLng(hospitalLat, hospitalLon),
      );
      if (directions == null) {}
      _info = directions!;

      print(
          "Get google maps data success...................................................");

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd  kk:mm').format(now);
      print(formattedDate);

      final url = Uri.https(
        "careme-test1-default-rtdb.firebaseio.com",
        "ambulance-request.json",
      );

      print(
          "Url 1 success............................................................");

      // final urlCopy = Uri.https(
      //   "careme-test1-default-rtdb.firebaseio.com",
      //   "ambulance-request-copy.json",
      // );

      // print(
      //     "Url 2 success............................................................");

      await FirebaseFirestore.instance
          .collection("patients")
          .doc(_rollNumber)
          .set({
            "patientId": _rollNumber,
            "patientName": _pName,
            "patientAge": _pAge,
            "patientGender": dropdownValueGender,
            "patientState": dropdownValueState,
            "patientDescription": _pDescription,
            "travelTime": _info.totalDuration,
            "ambulanceNo": userData.data()!["vehical-number"],
            "pickupLocation": _pickedLocation,
            "pickupTime": formattedDate,
          });

      print(
          "Firestore success............................................................");

      final responce = await http.post(
        url,
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode(
          {
            "patientId": _rollNumber,
            "patientName": _pName,
            "patientAge": _pAge,
            "patientGender": dropdownValueGender,
            "patientState": dropdownValueState,
            "patientDescription": _pDescription,
            "travelTime": _info.totalDuration,
            "ambulanceNo": userData.data()!["vehical-number"],
            "pickupLocation": _pickedLocation,
            "pickupTime": formattedDate,
          },
        ),
      );

      print(
          "Responce 1 success............................................................");

      // await http.post(
      //   urlCopy,
      //   headers: {
      //     "Content-type": "application/json",
      //   },
      //   body: json.encode(
      //     {
      //       "patientId": _rollNumber,
      //       "patientName": _pName,
      //       "patientAge": _pAge,
      //       "patientGender": dropdownValueGender,
      //       "patientState": dropdownValueState,
      //       "patientDescription": _pDescription,
      //       "travelTime": _info.totalDuration,
      //       "ambulanceNo": userData.data()!["vehical-number"],
      //       "pickupLocation": _pickedLocation,
      //       "pickupTime": dateTime,
      //     },
      //   ),
      // );

      // print(
      //     "Responce 2 success............................................................");

      print(responce.statusCode);

      final Map<String, dynamic> resData = json.decode(responce.body);

      if (!context.mounted) {
        return;
      }

      print(resData["patientName"]);

      final currentPatient = PatientData(
        databaseId: resData["name"],
        patientId: _rollNumber,
        patientName: _pName,
        patientAge: _pAge,
        patientGender: dropdownValueGender,
        patientState: dropdownValueState,
        patientDescription: _pDescription,
        travelTime: "10min",
        ambulanceNumber: "abc-1234",
        pickedLocation: _pickedLocation,
        isHandedOver: _isHandedOver,
      );

      final String timeEnstimated =
          "${_info.totalDuration} , ${_info.totalDistance}";

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => ResultsScreen(
            currentDatabaseId: currentPatient.databaseId,
            hospitalName: hospitalName,
            hospitalLat: hospitalLat,
            hospitalLon: hospitalLon,
            timeEstimated: timeEnstimated,
          ),
        ),
      );
    }
    return;
  }

  void _getCurrentLocation() async {
    FocusScope.of(context).unfocus();
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
      _isLocationSet = true;
    });

    locationData = await location.getLocation();

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    latitudeFinal = locationData.latitude!;
    longitudeFinal = locationData.longitude!;

    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyAcKZHMOpRIqKUPAAP1U-n8Vp6nEtg7pcs",
    );

    final response = await http.get(url);
    final resData = json.decode(response.body);
    final currentLocation = resData["results"][0]["formatted_address"];

    _pickedLocation = currentLocation;

    setState(() {
      _isGettingLocation = false;
    });
    print(longitudeFinal);
    print(latitudeFinal);
    print(currentLocation);
  }

  @override
  Widget build(BuildContext context) {
    Widget locationContent = Center(
      child: ElevatedButton(
        onPressed: _getCurrentLocation,
        child: Text("Get Current Location"),
      ),
    );

    if (_pickedLocation != null) {
      locationContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (_isGettingLocation) {
      locationContent = Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("Enter Patient Information"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          textCapitalization: TextCapitalization.sentences,
                          autocorrect: false,
                          decoration: InputDecoration(
                            label: Text(
                              "Name:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(155, 0, 0, 0),
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            fillColor: Color.fromARGB(255, 240, 247, 255),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter patient name.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _pName = value!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(
                              "Age:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(155, 0, 0, 0),
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            fillColor: Color.fromARGB(255, 240, 247, 255),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter a valid age.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _pAge = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            label: Text(
                              "Gender:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(155, 0, 0, 0),
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            fillColor: Color.fromARGB(255, 240, 247, 255),
                            filled: true,
                          ),
                          dropdownColor: Color.fromARGB(255, 203, 227, 254),
                          // value: dropdownValueGender,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null) {
                              return "Please select a gender.";
                            }
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueGender = newValue!;
                            });
                          },
                          items: <String>['Male', 'Female']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            label: Text(
                              "Patient State:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(155, 0, 0, 0),
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            fillColor: Color.fromARGB(255, 240, 247, 255),
                            filled: true,
                          ),
                          dropdownColor: Color.fromARGB(255, 203, 227, 254),
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null) {
                              return "Please select a state.";
                            }
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueState = newValue!;
                            });
                          },
                          items: <String>['Normal', 'Medium', 'Critical']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          textCapitalization: TextCapitalization.sentences,
                          autocorrect: true,
                          decoration: InputDecoration(
                            label: Text(
                              "Description  (Optional):",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(155, 0, 0, 0),
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            fillColor: Color.fromARGB(255, 240, 247, 255),
                            filled: true,
                          ),
                          onSaved: (value) {
                            _pDescription = value!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 240, 247, 255),
                          ),
                          child: locationContent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              if (!_isSending)
                GestureDetector(
                  onTap: _saveItem,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Color.fromARGB(134, 0, 0, 0),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Submit Patient Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              if (_isSending)
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need some help ? ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: _changeScreenHelp,
                    child: Text(
                      'Help',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
