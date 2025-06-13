import 'package:built_value/built_value.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  int get pageIndex;

  MainState._();

  factory MainState([void Function(MainStateBuilder) updates]) = _$MainState;

  factory MainState.initial() {
    return MainState((b) => b..pageIndex = 0);
  }
}
