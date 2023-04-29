import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final String imageLocation;
  final VoidCallback onPressed;

  const CircularIcon({
    Key? key,
    required this.imageLocation,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                imageLocation,
              ),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
