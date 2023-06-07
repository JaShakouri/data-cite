import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? fab;
  final Widget? navigationBar;
  final PreferredSizeWidget? appBar;
  final bool extendBody;

  const AppScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.navigationBar,
    this.fab,
    this.extendBody = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: navigationBar,
      extendBody: extendBody,
      body: SafeArea(
        top: false,
        bottom: false,
        child: body,
      ),
    );
  }
}
