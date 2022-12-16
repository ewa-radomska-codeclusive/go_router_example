import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigator/navigation_settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final featureName = '/books';
  final id = '3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).goNamed('menu');
              },
              child: const Text('Go to shell'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(bookScreen);
              },
              child: const Text('Go to book\'s list Go router'),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go(bookDetailPath('5'));
              },
              child: const Text('Deeplink with screens - Go router'),
            ),
          ],
        ),
      ),
    );
  }
}
