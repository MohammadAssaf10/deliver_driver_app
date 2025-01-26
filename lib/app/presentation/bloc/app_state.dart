import 'package:built_value/built_value.dart';

import '../../../core/utils/app_enums.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  Language get appLanguage;

  bool get isAuth;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initial() => AppState(
        (b) => b
          ..appLanguage = Language.en
          ..isAuth = false,
      );
}
