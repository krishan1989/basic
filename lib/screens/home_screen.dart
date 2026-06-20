import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  const HomeScreen({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(
                      name: "Krishan Kumar",
                      department: "ASD Lab",
                    ),
                  ),
                );
              },
              child: const Text("Go To Profile"),
            ),
            const SizedBox(height: 20),
            Text(email),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/settings',
                );
              },
              child: const Text("Go To Settings"),
            ),
          ],
        ),
      ),
    );
  }
}