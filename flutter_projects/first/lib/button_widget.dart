import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(this.globalKey, this.text, this.width, this.height,
      this.color, this.textColor,
      {super.key, this.onTap});

  final GlobalKey<FormState> globalKey;
  final void Function()? onTap;
  final String text;
  final double width;
  final double height;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(5, 50, 5, 5),
        decoration: const BoxDecoration(color: Color(0xFF20C3AF)),
        child: const Text('Login',
          textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }
}









