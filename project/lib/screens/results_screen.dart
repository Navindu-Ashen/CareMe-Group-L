import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareMe"),
      ),
 body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logoTN.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text('Patient information has been sent to'),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.lightBlueAccent,
                    child: Text('National Hospital Colombo'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.lightBlueAccent[200],
              child: Column(
                children: [
                  Text('Estimated Travel Time'),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('10 min'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.lightBlueAccent[400],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        size: 24,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  
                  Text('Hospital Location'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

    
  }

