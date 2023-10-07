import 'package:codyon/auth/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

enum Routes {
  login,
}

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/login",
      routes: [
        GoRoute(
          path: "/login",
          name: Routes.login.name,
          builder: (context, state) => const LoginScreen(),
        )
      ],
    );
  },
);
