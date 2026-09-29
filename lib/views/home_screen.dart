import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color.fromARGB(
                  255,
                  146,
                  7,
                  158,
                ), // Background color for the top half
                child: const Center(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey[200], // Background color for the bottom half
                child: const Center(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
