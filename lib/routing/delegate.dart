import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/navigation_stack_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:navigator_two/firstscreen.dart';
import 'package:navigator_two/routing/stack.dart';
import 'package:navigator_two/secondscreen.dart';
import 'package:navigator_two/thirdscreen.dart';
import 'package:navigator_two/fourthscreen.dart';
import 'package:navigator_two/fifthscreen.dart';
import 'package:navigator_two/sixthscreen.dart';
import 'package:navigator_two/seventhscreen.dart';


@injectable
class MainRouterDelegate extends RouterDelegate<NavigationStack>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final NavigationStack stack;

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
    super.dispose();
  }

  MainRouterDelegate(@factoryParam this.stack) : super() {
    stack.addListener(notifyListeners);
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Navigator(
        key: navigatorKey,
        pages: _pages(ref),

        /// callback when a page is popped.
        onPopPage: (route, result) {
          /// let the OS handle the back press if there was nothing to pop
          if (!route.didPop(result)) {
            return false;
          }

          /// if we are on root, let OS close app
          if (stack.items.length == 1) return false;

          /// if we are on root, let OS close app
          if (stack.items.isEmpty) return false;

          /// otherwise, pop the stack and consume the event
          stack.pop();
          return true;
        },
      );
    });
  }

  List<Page> _pages(WidgetRef ref) => stack.items
      .mapIndexed((e, i) => e.when(
            FirstScreen: () => const MaterialPage(child: FirstScreen()),
            SecondScreen: () => const MaterialPage(child: SecondScreen()),
            ThirdScreen: () => const MaterialPage(child: ThirdScreen()),
            FourthScreen: () => const MaterialPage(child: FourthScreen()),
            FifthScreen: () => const MaterialPage(child: FifthScreen()),
            SixthScreen: () => const MaterialPage(child: SixthScreen()),
            SeventhScreen: () => const MaterialPage(child: SeventhScreen()),
          ))
      .toList();

  @override
  NavigationStack get currentConfiguration => stack;

  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    stack.items = configuration.items;
  }
}

extension _IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
