import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 146, 7, 158),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity, // Ensures Column takes full screen width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Keeps it near top
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centers horizontally
              children: const [
                SizedBox(height: 100), // Distance from the top
                Text(
                  'Welcome To My Expenses Tracker',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
