import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  final String name;
  final String developer;
  final String version;
  
  const AboutScreen(
    {
      super.key,
      required this.name,
      required this.developer,
      required this.version,

    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 10,
              child: Icon(
                Icons.info,
                size: 50,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              developer,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              version,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
           
          
          ],
        ),
      ),
    );
  }

}