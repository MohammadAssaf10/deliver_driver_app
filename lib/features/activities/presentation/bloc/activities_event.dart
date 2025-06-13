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
