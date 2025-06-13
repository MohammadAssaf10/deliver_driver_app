import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_enums.dart';
import '../../domain/repositories/activities_repository.dart';
import 'activities_event.dart';
import 'activities_state.dart';

@injectable
class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final ActivitiesRepository _activitiesRepository;

  void getDriverFinancialHistory() => add(GetDriverFinancialHistory());

  ActivitiesBloc(this._activitiesRepository)
    : super(ActivitiesState.initial()) {
    on<GetDriverFinancialHistory>((event, emit) async {
      if (state.financial != null) return;
      emit(state.rebuild((b) => b..financialStatus = BlocStatus.loading));
      final result = await _activitiesRepository.getDriverFinancialHistory();
      result.fold(
        (failure) {
          emit(state.rebuild((b) => b..financialStatus = BlocStatus.error));
        },
        (data) {
          emit(
            state.rebuild(
              (b) => b
                ..financial = data
                ..financialStatus = BlocStatus.success,
            ),
          );
        },
      );
    });
  }
}
