import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 80),
              SizedBox(height: kDefaultPadding / 2),
              Skeleton(),
              SizedBox(height: kDefaultPadding / 2),
              Skeleton(),
              SizedBox(height: kDefaultPadding / 2),
              Row(
                children: [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: kDefaultPadding),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
