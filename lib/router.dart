import 'package:codyon/auth/screens/login_screen.dart';
import 'package:codyon/auth/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

enum Routes {
  login,
  welcome,
}

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/welcome",
      routes: [
        GoRoute(
          path: "/login",
          name: Routes.login.name,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/welcome",
          name: Routes.welcome.name,
          builder: (context, state) => const WelcomeScreen(),
        )
      ],
    );
  },
);
