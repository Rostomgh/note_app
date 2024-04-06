import 'package:flutter/material.dart';
import 'package:note_app/Custom/Card.dart'; // Assuming CardNotes is imported from this file
import 'package:note_app/Custom/Fhome.dart';
import 'package:note_app/Custom/Dhome.dart';

class HomePage extends StatelessWidget {
  //final int dataLength; // Assuming you have this variable to represent data length
//required this.dataLength
  const HomePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 9,
        backgroundColor: Colors.orange, 
        title: const Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'new');
        },
        child: const Icon(Icons.add, color: Colors.orange, size: 35),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Fhome(),
          Dhome(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CardNotes(), 
            ),
          ),
        ],
      ),
    );
  }
}
