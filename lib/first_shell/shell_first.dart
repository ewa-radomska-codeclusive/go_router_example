import 'package:flutter/material.dart';

class ShellFirst extends StatelessWidget {
  const ShellFirst({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: child,
        ),
        Container(
          height: 60,
          color: Colors.orange,
          child: const Center(child: Text('bottom notification')),
        )
      ]),
    );
  }
}
