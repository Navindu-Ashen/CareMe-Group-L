import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/profile_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/images/logoTN2.png",
                      width: double.infinity, alignment: Alignment.center),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          size: 30,
                          color: Color.fromARGB(255, 66, 89, 120),
                        ),
                        title: Text(
                          "Profile",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Color.fromARGB(255, 66, 89, 120),
                                    fontSize: 20,
                                  ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ProfileScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.info_outline_rounded,
                          size: 30,
                          color: Color.fromARGB(255, 66, 89, 120),
                        ),
                        title: Text(
                          "About Us",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Color.fromARGB(255, 66, 89, 120),
                                    fontSize: 20,
                                  ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => HelpScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: ListTile(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      leading: Icon(
                        Icons.logout,
                        size: 26,
                        color: Color.fromARGB(255, 255, 66, 66),
                      ),
                      title: Text(
                        "LOGOUT",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Color.fromARGB(255, 255, 66, 66),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
          )
        ],
      ),
    );
  }
}
