import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/widgets/card_skeleton.dart';
import 'package:flutter/material.dart';

readAllLoading() {
  return ListView.separated(
    itemCount: 8,
    padding: const EdgeInsets.symmetric(
      horizontal: kDefaultPadding,
      vertical: 16,
    ),
    itemBuilder: (context, index) => const CardSkeleton(),
    physics: const NeverScrollableScrollPhysics(),
    separatorBuilder: (context, index) => const SizedBox(
      height: kDefaultPadding,
    ),
  );
}

emptyView() {
  return Center(
    child: SizedBox(
      width: 250,
      height: 250,
      child: Column(
        children: [
          Image.asset(
            "assets/images/empty.png",
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "Data is empty",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    ),
  );
}