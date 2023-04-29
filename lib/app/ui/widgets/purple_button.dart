import 'package:flutter/material.dart';
import 'package:assessment/app/core/themes.dart';

class PurpleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PurpleButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        decoration: BoxDecoration(
          color: purple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: pureWhite,
            ),
          ),
        ),
      ),
    );
  }
}
