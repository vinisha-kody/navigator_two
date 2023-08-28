import 'package:flutter/material.dart';
import 'package:navigator_two/firstscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_two/routing/delegate.dart';
import 'package:navigator_two/routing/parser.dart';
import 'package:navigator_two/routing/stack.dart';
import 'package:navigator_two/framework/dependency_injection/inject.dart';
import 'dart:collection';
import 'package:url_strategy/url_strategy.dart';
Future<void> main() async {
  //setPathUrlStratergy();
  WidgetsFlutterBinding.ensureInitialized();
  await configureMainDependencies(environment: Env.dev);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: getIt<MainRouterDelegate>(param1: ref.read(navigationStackProvider)),
      routeInformationParser: getIt<MainRouterInformationParser>(param1: ref,param2: context),
      );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Flutter Navigator 2.0',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       routerDelegate: getIt<MainRouterDelegate>(
//           param1: ref.read(navigationStackProvider)),
//       routeInformationParser: getIt<MainRouterInformationParser>(
//           param1: ref, param2: context),
//     );
//   }
// }
//
//
// class MyAppPage extends ConsumerStatefulWidget {
//   const MyAppPage({super.key});
//
//   @override
//   ConsumerState<MyAppPage> createState() => _MyAppPageState();
// }
//
// class _MyAppState extends ConsumerState<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
