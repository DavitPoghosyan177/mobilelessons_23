import 'package:flutter/material.dart';

class ButtonWidgetProfile extends StatelessWidget {
  const ButtonWidgetProfile({super.key});


  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/');
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF20C3AF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: 1),
      child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Log out",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )));
                      }
}
