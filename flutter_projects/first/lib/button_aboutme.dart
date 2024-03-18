import 'package:flutter/material.dart';

class ButtonWidgetProfileAb extends StatelessWidget {
  const ButtonWidgetProfileAb({super.key});


  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: 1),
      child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "About me",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700),
      
          )));
  }

}
