import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:app_weight/bet/presentation/screens/bet_details_screen.dart';
import 'package:app_weight/user/presentation/widgets/icon_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_weight/ui_screens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

enum AppRoute { home, bet, person }

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('VERSUS'), actions: [IconAuth()]),
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            name: AppRoute.home.name,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
            routes: [
              GoRoute(
                path: '/bet/:bid',
                name: AppRoute.bet.name,
                builder: (context, state) {
                  final bid = state.pathParameters['bid']!;
                  final bet = state.extra as Bet?; // opcional
                  return BetDetailScreen(betId: bid, bet: bet);
                },
              ),
            ],
          ),
        ],
      ),
      // GoRoute(
      //   path: '/home',
      //   name: AppRoute.home.name,
      //   pageBuilder: (context, state) =>
      //       const NoTransitionPage(child: HomeScreen()),
      //   routes: [
      //     GoRoute(
      //   path: '/bet/:bid',
      //   name: AppRoute.bet.name,
      //   builder: (context, state) {
      //     final bid = state.pathParameters['bid']!;
      //     final bet = state.extra as Bet?; // opcional
      //     return BetDetailScreen(betId: bid, bet: bet);
      //   },
      // ),
      //   ]
      // ),

      // GoRoute(
      //   path: '/bet/:bid',
      //   name: AppRoute.bet.name,
      //   builder: (context, state) {
      //     final bid = state.pathParameters['bid']!;
      //     final bet = state.extra as Bet?; // opcional
      //     return BetDetailScreen(betId: bid, bet: bet);
      //   },
      // ),

      // GoRoute(
      //   path: '/bets/:id',
      //   name: 'betDetail',
      //   builder: (context, state) {
      //     final betId = state.pathParameters['id'];
      //     return BetDetailScreen(betId: betId);

      //   },

      // ),
    ],
  );
}
