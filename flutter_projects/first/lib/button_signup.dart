import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.text, this.onTap, super.key});
   final void Function()? onTap;

    final String text;
    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
 
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(5, 16, 5, 5),
        decoration: const BoxDecoration(color: Color(0xFF20C3AF)),
        child: const Text('Sign Up',
          textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }
}
