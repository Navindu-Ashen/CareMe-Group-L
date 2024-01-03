import 'package:flutter/material.dart';
import 'package:project/screens/results_screen.dart';

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {

  void _changeScreenResults(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ResultsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Patient Information"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 0,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(255, 91, 161, 218),),
                  height: 200,
                  child: Column(children: [
                    TextField(),
                  ],),
                  
                ),
              )
            ],
          ),
          Container(
            color: const Color.fromARGB(255, 107, 145, 196),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.white60,
                  child: const Column(
                    children: [
                      Icon(
                        Icons.help_outline,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      Text(
                        "Help",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
