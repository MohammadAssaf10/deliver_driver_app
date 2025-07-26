import 'package:built_value/built_value.dart';

part 'activities_event.g.dart';

abstract class ActivitiesEvent {}

abstract class GetDriverFinancialHistory extends ActivitiesEvent
    implements
        Built<GetDriverFinancialHistory, GetDriverFinancialHistoryBuilder> {
  GetDriverFinancialHistory._();
  factory GetDriverFinancialHistory([
    void Function(GetDriverFinancialHistoryBuilder) updates,
  ]) = _$GetDriverFinancialHistory;
}

abstract class GetDriverTripsHistory extends ActivitiesEvent
    implements Built<GetDriverTripsHistory, GetDriverTripsHistoryBuilder> {
  GetDriverTripsHistory._();
  factory GetDriverTripsHistory([
    void Function(GetDriverTripsHistoryBuilder) updates,
  ]) = _$GetDriverTripsHistory;
}
