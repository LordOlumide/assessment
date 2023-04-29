import 'package:assessment/app/core/themes.dart';
import 'package:flutter/material.dart';

class ColouredTile extends StatelessWidget {
  final int? number;
  final String text;
  final Color color;
  final Color textColor;

  const ColouredTile({
    Key? key,
    this.number,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number != null ? '$number+' : '- -',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  color: textColor,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
