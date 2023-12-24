import 'package:flutter/material.dart';
import 'package:project/screens/help_screen.dart';
import 'package:project/screens/welcome_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = WelcomeScreen();
    var acticePageTitle = "CareMe";

    if (_selectedPageIndex == 1) {
      activePage = const HelpScreen();
      acticePageTitle = "CareMe Help";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(acticePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: "Login",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
            ),
            label: "Help",
          )
        ],
      ),
    );
  }
}
