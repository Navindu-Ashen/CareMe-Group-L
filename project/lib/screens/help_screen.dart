import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CareMe Help"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Help Screen",
              style: TextStyle(
                fontSize: 28,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                """CareMe\n is a great tool to have in case of an emergency.
When it comes to emergencies related to health, time is of the essence,
this is an essential tool to have at your fingertips in case of any unexpected health emergencies.
With a few clicks on your phone, you can quickly access the necessary resources to get your needed help.""",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 107, 145, 196),
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                          size: 30,
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
            ),
          ],
        ),
      ),
    );
  }
}
