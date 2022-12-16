import 'package:flutter/material.dart';
import 'package:go_router_navigator/books/book_tile.dart';
import 'package:go_router_navigator/books/books.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: ListView.builder(
        itemBuilder: (context, index) => BookTile(book: books[index]),
        itemCount: books.length,
      ),
    );
  }
}
