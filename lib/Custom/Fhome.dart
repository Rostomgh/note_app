import 'package:flutter/material.dart';

class Fhome extends StatelessWidget {
  const Fhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 40),
      ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.orange.withOpacity(0.2),
          BlendMode.srcATop,
        ),
        child: Image.asset("assets/img/Logo1.jpg", width: 60),
      ),
      const SizedBox(height: 20),
      const Text(
        "My Notes",
        style: TextStyle(fontSize: 29),
      ),
      const SizedBox(height: 7),
      const Text(
        '200 notes',
        style: TextStyle(fontSize: 20, color: Colors.orange),
      )
    ]);
  }
}
