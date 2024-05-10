import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmealsweb/home.dart';
import 'package:petmealsweb/termsconditions.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/terms-conditions',
      builder: (BuildContext context, GoRouterState state) {
        return const TermsConditionsPage();
      },
    ),
  ],
);
