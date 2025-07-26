import 'package:built_value/built_value.dart';

import '../../../../core/utils/app_enums.dart';
import '../../domain/entities/financial.dart';
import '../../domain/entities/history.dart';

part 'activities_state.g.dart';

abstract class ActivitiesState
    implements Built<ActivitiesState, ActivitiesStateBuilder> {
  BlocStatus get financialStatus;
  Financial? get financial;

  BlocStatus get tripsHistoryStatus;
  List<History> get tripsHistory;

  ActivitiesState._();
  factory ActivitiesState([void Function(ActivitiesStateBuilder) updates]) =
      _$ActivitiesState;

  factory ActivitiesState.initial() => ActivitiesState(
    (b) => b
      ..financialStatus = BlocStatus.loading
      ..financial = null
      ..tripsHistoryStatus = BlocStatus.loading
      ..tripsHistory = [],
  );
}
