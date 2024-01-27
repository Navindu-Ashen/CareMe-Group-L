import 'package:flutter/material.dart';
import 'package:project/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileCard(),
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
    );
  }
}
