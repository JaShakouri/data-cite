import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.isLightLoading = true}) : super(key: key);

  final bool isLightLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: isLightLoading ? Colors.white : Colors.black,
        animating: true,
        radius: 12.0,
      ),
    );
  }
}
