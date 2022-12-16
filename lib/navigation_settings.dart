import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigator/books/book_details.dart';
import 'package:go_router_navigator/books/book_list.dart';
import 'package:go_router_navigator/first_shell/screen_in_first_shell.dart';
import 'package:go_router_navigator/home_page.dart';
import 'package:go_router_navigator/second_shell/route_in_shell_first.dart';
import 'package:go_router_navigator/second_shell/route_in_shell_root_navigator.dart';
import 'package:go_router_navigator/second_shell/route_in_shell_second.dart';
import 'package:go_router_navigator/second_shell/shell.dart';
import 'package:go_router_navigator/first_shell/shell_first.dart';

const bookScreen = 'books';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _notificationShellNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _detailsShellNavigatorKey =
    GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
      routes: [
        ShellRoute(
            navigatorKey: _notificationShellNavigatorKey,
            builder: (context, state, child) => ShellFirst(
                  child: child,
                ),
            routes: [
              GoRoute(
                  path: 'first-shell-menu',
                  name: 'menu',
                  builder: (context, state) => const ScreenInFirstShell(),
                  parentNavigatorKey: _notificationShellNavigatorKey,
                  routes: [
                    ShellRoute(
                      navigatorKey: _detailsShellNavigatorKey,
                      builder: (context, state, child) {
                        return Shell(child: child);
                      },
                      routes: [
                        GoRoute(
                            path: 'first-screen',
                            name: 'first',
                            builder: (context, state) =>
                                const RouteInShellFirst(),
                            parentNavigatorKey: _detailsShellNavigatorKey),
                        GoRoute(
                            path: 'second-screen',
                            name: 'second',
                            builder: (context, state) =>
                                const RouteInShellSecond(),
                            parentNavigatorKey: _detailsShellNavigatorKey),
                        GoRoute(
                            path: 'overlay-screen',
                            name: 'overlay',
                            builder: (context, state) =>
                                const RouteInShellRootNavigator(),
                            parentNavigatorKey: rootNavigatorKey),
                      ],
                    )
                  ]),
              GoRoute(
                path: 'books',
                name: bookScreen,
                builder: (BuildContext context, GoRouterState state) {
                  return const BookList();
                },
                routes: [
                  GoRoute(
                      path: ':id',
                      builder: (context, state) {
                        if (state.params['id'] != null) {
                          return BookDetails(id: state.params['id']!);
                        } else {
                          return const BookList();
                        }
                      }),
                ],
              ),
            ]),
      ],
    ),
  ],
);

String bookDetailPath(String id) {
  return '/books/$id';
}

String booksListPath() {
  return '/books';
}
