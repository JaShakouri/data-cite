import 'package:flutter/material.dart';
import 'package:de_dtcite/core/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
    this.radius = kDefaultPadding,
  }) : super(key: key);

  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.all(Radius.circular(radius!))),
      ),
      baseColor: Colors.black,
      highlightColor: Colors.black.withOpacity(
        0.5,
      ),
    );
  }
}
