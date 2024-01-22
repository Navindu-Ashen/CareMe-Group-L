import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  var userName = "Data Fetching Failed";
  var userEmail = "Data Fetching Failed";
  var vehicalNumber = "failed";
  var imageUrl;
  var _isGetUserData = false;

  void getuserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (!_isGetUserData) {
      setState(() {
        userName = userData.data()!["user-name"];
        vehicalNumber = userData.data()!["vehical-number"];
        imageUrl = userData.data()!["image-url"];
        userEmail = userData.data()!["email"];
      });
      _isGetUserData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getuserData();
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.all(16),
          child: Card(
            color: const Color.fromARGB(255, 156, 188, 238),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 66, 89, 121),
                      ),
                      child: Text(
                        userName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: Text(
                      userEmail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 66, 89, 121),
                    ),
                    child: Text(
                      vehicalNumber,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 170,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 217, 217, 217),
                    ),
                    child: Image.asset(
                      "assets/images/logoTN2.png",
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Ambulance",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 66, 89, 121),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        if(imageUrl != null)
        Positioned(
          left: 50,
          right: 50,
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: const Color.fromARGB(255, 217, 217, 217),
            radius: 110,
          ),
        ),
        if(imageUrl == null)
        Positioned(
          left: 50,
          right: 50,
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 217, 217, 217),
            radius: 110,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
