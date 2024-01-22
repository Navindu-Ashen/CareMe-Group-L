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
      body: ProfileCard(),
    );
  }
}
