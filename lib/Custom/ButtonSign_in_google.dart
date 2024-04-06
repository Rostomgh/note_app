import 'package:flutter/material.dart';

class Button_Google extends StatelessWidget {
  final void Function()? onpress;
  const Button_Google({super.key, this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 45,
      child: ElevatedButton.icon(
        onPressed: onpress,
        icon: const Icon(Icons.login),
        label: const Text('Sign in with Google',style: TextStyle(fontSize: 16),),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
