import 'package:flutter/material.dart';
import 'package:project/screens/map_screen.dart';
import 'package:http/http.dart' as http;

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.currentDatabaseId,
    required this.hospitalName,
    required this.hospitalLat,
    required this.hospitalLon,
    required this.timeEstimated,
  });

  final String currentDatabaseId;
  final String hospitalName;
  final double hospitalLat;
  final double hospitalLon;
  final String timeEstimated;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  void _patientArrived() async {
    print(widget.currentDatabaseId);

    final url = Uri.https(
      "careme-test1-default-rtdb.firebaseio.com",
      "ambulance-request/${widget.currentDatabaseId}.json",
    );
    final responce = await http.delete(url);

    if (responce.statusCode >= 400) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Somthing went wrong"),
        ),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(200, 92, 255, 100),
                        child: Icon(
                          Icons.done_rounded,
                          size: 50,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Patient information has \n been sent to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 226, 226, 226),
                        ),
                        child: Text(
                          widget.hospitalName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Estimated Travel Time and Distance:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          widget.timeEstimated,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MapScreen(
                          hospitalName: widget.hospitalName,
                          hospitalLat: widget.hospitalLat,
                          hospitalLon: widget.hospitalLon,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Color.fromARGB(100, 0, 0, 0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      // color: const Color.fromARGB(255, 110, 201, 204),
                      color: const Color.fromARGB(255, 226, 226, 226),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Gmap_logo.png",
                          width: 200,
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Text(
                            'Hospital Location',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 226, 226, 226),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton.icon(
                // style: ElevatedButton.styleFrom(
                //     backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  _patientArrived();
                  // Navigator.of(context).pop();
                },
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.download_done_rounded,
                    size: 36,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Handed Over",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Exit Disabled'),
              content: const Text(
                  'Hand over the patient and press Handed Over to exit'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    'Close',
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
    );
  }
}
