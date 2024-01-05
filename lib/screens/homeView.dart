import 'package:ARhomes/screens/accountsPage.dart';
import 'package:ARhomes/screens/explorepage.dart';
import 'package:ARhomes/screens/itemListScreen.dart';
import 'package:ARhomes/screens/showSnackBar.dart';
import 'package:ARhomes/screens/welcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final pages = [
    const itemListScreen(),
    const ExplorePage(),
    // const itemListScreen(),

    const AccountsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ARhomes",
          style: TextStyle(
            fontFamily: 'Pony',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF142323),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                }).catchError((e) {
                  showSnakBar(context, e.message);
                });
              },
              icon: Icon(Icons.login_rounded))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF142323),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          )
        ],
        backgroundColor: Color(0xFF142323),
        // fixedColor: Colors.green,
        selectedItemColor: Colors.white,
        // selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(color: Colors.white),
      ),
      body: Center(child: pages[_currentIndex]),
    );
  }
}
