import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/app_starter_point.dart';

abstract class AppRouter {
  static const kStarterPoint = '/';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kStarterPoint,
        builder: (BuildContext context, GoRouterState state) {
          return const AppStarterPoint();
        },
      ),
    ],
  );
}
