import 'package:flutter/material.dart';

class PortfolioItemWidget extends StatelessWidget {
  final AssetImage? image;
  final double size;

  const PortfolioItemWidget({Key? key, this.image, this.size = 120.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: image == null
          ? const Center(child: CircularProgressIndicator())
          : null,
    );
  }
}
