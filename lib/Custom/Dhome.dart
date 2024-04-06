import 'package:flutter/material.dart';
import 'package:note_app/Pr%C3%A9sentation/auth/Login.dart';


class Dhome extends StatelessWidget {
  const Dhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 210),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
