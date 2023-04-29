import 'package:flutter/material.dart';
import '../../core/themes.dart';

class MajorContainer extends StatelessWidget {
  final Widget? child;
  const MajorContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkGrey,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: child,
    );
  }
}
