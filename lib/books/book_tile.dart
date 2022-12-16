import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigator/books/book.dart';
import 'package:go_router_navigator/navigation_settings.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(bookDetailPath(book.id)),
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(10),
        child: Container(
          height: 100,
          color: Colors.white,
          child: ListTile(
            leading: Image.network(book.url),
            title: Text(book.title),
            subtitle: Text(book.author),
          ),
        ),
      ),
    );
  }
}
