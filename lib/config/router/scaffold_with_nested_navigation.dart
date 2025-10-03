// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ScaffoldWithNestedNavigation extends StatelessWidget {
//   const ScaffoldWithNestedNavigation({
//     Key? key,
//     required this.navigationShell,
//   }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
//   final StatefulNavigationShell navigationShell;

//   void _goBranch(int index) {
//     navigationShell.goBranch(
//       index,
//       // A common pattern when using bottom navigation bars is to support
//       // navigating to the initial location when tapping the item that is
//       // already active. This example demonstrates how to support this behavior,
//       // using the initialLocation parameter of goBranch.
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     if (size.width < 450) {
//       return ScaffoldWithNavigationBar(
//         body: navigationShell,
//         currentIndex: navigationShell.currentIndex,
//         onDestinationSelected: _goBranch,
//       );
//     } else {
//       return ScaffoldWithNavigationRail(
//         body: navigationShell,
//         currentIndex: navigationShell.currentIndex,
//         onDestinationSelected: _goBranch,
//       );
//     }
//   }
// }