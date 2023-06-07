import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:de_dtcite/core/widgets/loading.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, this.dismissable = true}) : super(key: key);

  final bool dismissable;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          return Future.value(dismissable);
        },
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          extendBody: true,
          body: const Loading(),
        ),
      ),
    );
  }
}
