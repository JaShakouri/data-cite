import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:de_dtcite/core/widgets/dialogs/loading_dialog.dart';

PageRouteBuilder? _loadingRoute;

Future<dynamic> showLoading({bool dismissable = true}) async {
  _loadingRoute = _getLoadingDialog(dismissable);

  if (_loadingRoute != null) {
    return Navigator.of(ContextHolder.currentContext).push(_loadingRoute!);
  }
}

showForceLoading() {
  showLoading(dismissable: false);
}

dismissLoading() async {
  if (_loadingRoute != null && _loadingRoute!.isActive) {
    return Navigator.of(ContextHolder.currentContext)
        .removeRoute(_loadingRoute!);
  }
}

PageRouteBuilder _getLoadingDialog(bool dismissable) {
  return PageRouteBuilder(
    opaque: false,
    barrierDismissible: dismissable,
    pageBuilder: (BuildContext context, _, __) => LoadingDialog(
      dismissable: dismissable,
    ),
  );
}
