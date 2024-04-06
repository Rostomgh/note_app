import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color cs;

  const CustomButton({Key? key, this.onPressed, required this.text, required this.cs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      decoration: BoxDecoration(
        color:cs,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
      
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
