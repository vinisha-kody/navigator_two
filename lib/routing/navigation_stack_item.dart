import 'package:freezed_annotation/freezed_annotation.dart';
part 'navigation_stack_item.freezed.dart';

@freezed
class NavigationStackItem with _$NavigationStackItem {
  const factory NavigationStackItem.FirstScreen() = NavigationStackItemFirstScreen;
  const factory NavigationStackItem.SecondScreen() = NavigationStackItemSecondScreen;
  const factory NavigationStackItem.ThirdScreen() = NavigationStackItemThirdScreen;
  const factory NavigationStackItem.FourthScreen() = NavigationStackItemFourthScreen;
  const factory NavigationStackItem.FifthScreen() = NavigationStackItemFifthScreen;
  const factory NavigationStackItem.SixthScreen() = NavigationStackItemSixthScreen;
  const factory NavigationStackItem.SeventhScreen() = NavigationStackItemSeventhScreen;
}
