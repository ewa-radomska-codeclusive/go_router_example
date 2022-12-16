import 'package:flutter/material.dart';

class RouteInShellRootNavigator extends StatelessWidget {
  const RouteInShellRootNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
            'this is the route from shell, but with root navigator key, showing over the shell'),
      ),
    );
  }
}
