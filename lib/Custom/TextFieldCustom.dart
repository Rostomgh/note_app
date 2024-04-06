import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String text;
  final TextEditingController mycontroller;
  final bool obc;

  const CustomTextField({
    Key? key,
    this.validator,
    required this.text,
    required this.mycontroller,
    required this.obc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
       
          width: 350,
          child: TextFormField(
            validator: validator,
            controller: mycontroller,
            obscureText: obc,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              labelText: text,
              hintText: 'Enter $text', 
              hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
    );
  
  }
}
