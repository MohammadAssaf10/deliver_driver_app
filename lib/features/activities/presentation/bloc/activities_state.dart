import 'package:built_value/built_value.dart';

import '../../../../core/utils/app_enums.dart';
import '../../domain/entities/financial.dart';

part 'activities_state.g.dart';

abstract class ActivitiesState
    implements Built<ActivitiesState, ActivitiesStateBuilder> {
  BlocStatus get financialStatus;
  Financial? get financial;

  ActivitiesState._();
  factory ActivitiesState([void Function(ActivitiesStateBuilder) updates]) =
      _$ActivitiesState;

  factory ActivitiesState.initial() => ActivitiesState(
    (b) => b
      ..financialStatus = BlocStatus.loading
      ..financial = null,
  );
}
