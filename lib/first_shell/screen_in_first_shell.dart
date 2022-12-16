import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenInFirstShell extends StatelessWidget {
  const ScreenInFirstShell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).goNamed('first');
              },
              child: const Text('Go to second shell'))),
    );
  }
}
