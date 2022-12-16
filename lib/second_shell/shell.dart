import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Shell extends StatefulWidget {
  const Shell({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () => GoRouter.of(context).goNamed('overlay'),
            child: Container(
              height: 300,
              color: Colors.amber,
            ),
          ),
          TabBar(
              onTap: (value) {
                switch (value) {
                  case 0:
                    GoRouter.of(context).goNamed('first');
                    break;
                  case 1:
                    GoRouter.of(context).goNamed('second');
                    break;
                }
              },
              labelColor: Colors.black,
              controller: controller,
              tabs: const [
                Tab(text: 'First'),
                Tab(text: 'Second'),
              ]),
          SizedBox(height: 300, child: widget.child),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
