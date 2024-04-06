import 'package:flutter/material.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.mycontroller, this.valid});
  final TextEditingController mycontroller;
  final String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: false,
        decoration: InputDecoration(
            hintText: ("Your Note :"),
            hintStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300
            ),
            labelText:"Your Note",
            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.orange),
            )),
      ),
    );
  }
}
