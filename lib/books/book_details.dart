import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigator/books/books.dart';

class BookDetails extends StatelessWidget {
  final String id;
  const BookDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final book = books.firstWhere(
      (element) => element.id == id,
    );
    return Scaffold(
        appBar: AppBar(title: Text(book.title)),
        body: Center(
          child: Column(children: [
            Stack(children: [
              Image.network(book.url),
              Text(
                book.author,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ]),
            const SizedBox(
              height: 12,
            ),
            Text(book.details),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('Back to the list'),
            ),
          ]),
        ));
  }
}
