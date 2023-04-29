import 'package:assessment/app/core/themes.dart';
import 'package:flutter/material.dart';

class PortfolioItemWidget extends StatelessWidget {
  final AssetImage? image;
  final double size;
  final bool isSeeMoreTile;

  const PortfolioItemWidget({
    Key? key,
    this.image,
    this.size = 120.0,
    this.isSeeMoreTile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(5.0),
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
          : isSeeMoreTile
              ? Container(
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      'Read More',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: pureWhite,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
    );
  }
}
