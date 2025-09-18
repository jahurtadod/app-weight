import 'package:go_router/go_router.dart';
import 'package:app_weight/ui_screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);