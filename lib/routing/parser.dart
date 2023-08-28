
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:navigator_two/routing/navigation_stack_item.dart';
import 'package:navigator_two/routing/stack.dart';
import 'package:navigator_two/routing/navigation_stack_keys.dart';

@injectable
class MainRouterInformationParser
    extends RouteInformationParser<NavigationStack> {
  WidgetRef ref;
  BuildContext context;

  MainRouterInformationParser(
      @factoryParam this.ref, @factoryParam this.context);

  @override
  Future<NavigationStack> parseRouteInformation(
      RouteInformation routeInformation) async {
    print("........URL......${routeInformation.location}");

    final Uri uri = Uri.parse(routeInformation.location ?? "");
    final queryParams = uri.queryParameters;
    final items = <NavigationStackItem>[];
    debugPrint('Stack Item Count - ${items.length}');
    //String? langStr = queryParams['lang'];

    // if (langStr != null) {
    //   await context.setLocale(Locale(langStr == "english" ? "en" : "hi"));
    // }

    for (var i = 0; i < uri.pathSegments.length; i = i + 1) {
      final key = uri.pathSegments[i];
      
      switch(key){
        case Keys.firstscreen:
          items.add(NavigationStackItem.FirstScreen());
          break;
        case Keys.secondscreen:
          items.add(NavigationStackItem.SecondScreen());
          break;
        case Keys.thirdscreen:
          items.add(NavigationStackItem.ThirdScreen());
          break;
        case Keys.fourthscreen:
          items.add(NavigationStackItem.FourthScreen());
          break;
        case Keys.fifthscreen:
          items.add(NavigationStackItem.FifthScreen());
          break;
        case Keys.sixthscreen:
          items.add(NavigationStackItem.SixthScreen());
          break;
        case Keys.seventhscreen:
          items.add(NavigationStackItem.SeventhScreen());
          break;
        default:
          items.add(NavigationStackItem.FirstScreen());
      }

    }
    if (items.isEmpty) {
      const fallback = NavigationStackItem.FirstScreen(); //NavigationStackItem.customerInfo();
      if (items.isNotEmpty && items.first is NavigationStackItemFirstScreen) {
        items[0] = fallback;
      } else {
        items.insert(0, fallback);
      }
    }
    return NavigationStack(items);
  }

  ///THIS IS IMPORTANT: Here we restore the web history
  @override
  RouteInformation restoreRouteInformation(NavigationStack configuration) {
    final location =
        configuration.items.fold<String>("", (previousValue, element) {
      return previousValue +
          element.when(
            FirstScreen: () => '/${Keys.firstscreen}',
            SecondScreen: () => '/${Keys.secondscreen}',
            ThirdScreen: () => '/${Keys.thirdscreen}',
            FourthScreen: () => '/${Keys.fourthscreen}',
            FifthScreen: () => '/${Keys.fifthscreen}',
            SixthScreen: () => '/${Keys.sixthscreen}',
            SeventhScreen: () => '/${Keys.seventhscreen}',
          );
    });

    ///Return null will be stay in first route page  , if we reached first page then location will empty
    return RouteInformation(location: location);
  }
}
