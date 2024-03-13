import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("CareMe Help"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(200, 208, 220, 255),
                        radius: 30,
                        child: Icon(
                          Icons.call,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our 24 x 7 customer service",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(155, 130, 130, 130),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "011 9 234 567",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(200, 208, 220, 255),
                        radius: 30,
                        child: Icon(
                          Icons.mail,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mail inquiry services",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(155, 130, 130, 130),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "inquiry@careme.lk",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: -5,
                      color: const Color.fromARGB(100, 0, 0, 0),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color.fromARGB(255, 241, 244, 250),
                      ),
                      child: Image.asset(
                        "assets/images/logoTN2.png",
                        height: 60,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    const Text(
                      '''CareMe is a great tool to have in case of an emergency.
        When it comes to emergencies related to health, time is of the essence, this is an essential tool to have at your fingertips in case of any unexpected health emergencies.
        With a few clicks on your phone, you can quickly access the necessary resources to get your needed help.''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Copyright",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.copyright,
                  size: 14,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "2024, CareMe",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
