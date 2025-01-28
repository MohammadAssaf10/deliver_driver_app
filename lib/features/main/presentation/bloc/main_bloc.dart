import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_functions.dart';
import '../../data/repositories/main_repository.dart';
import '../pages/home_body.dart';
import 'main_event.dart';
import 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  final PageController pageController = PageController();
  final ScrollController controller = ScrollController();
  final List<Widget> pages = const [
    HomeBody(),
    // ActivitiesPage(),
    // AccountPage(),
  ];
  final MainRepository _mainRepository;

  void setPageIndex(int pageIndex) =>
      add(SetPageIndex((b) => b..pageIndex = pageIndex));

  void getCurrentTrip() => add(GetCurrentTrip());

  void getAvailableTrips() => add(GetAvailableTrips());

  MainBloc(
    this._mainRepository,
  ) : super(MainState.initial()) {
    on<SetPageIndex>((event, emit) {
      emit(state.rebuild((b) => b..pageIndex = event.pageIndex));
    });
    on<GetCurrentTrip>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      final result = await _mainRepository.getCurrentTrip();
      result.fold((failure) {
        showToastMessage(
          failure.errorMessage,
          isError: true,
        );
        emit(state.rebuild((b) => b..isLoading = false));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..currentTrip = data,
        ));
      });
    });
    on<GetAvailableTrips>((event, emit) async {
      if (state.trips.currentPage == 1) {
        emit(state.rebuild((b) => b..isLoading = true));
      } else {
        emit(state.rebuild((b) => b..trips.isLoading = true));
      }
      final result =
          await _mainRepository.getAvailableTrips(state.trips.currentPage);
      result.fold((failure) {
        showToastMessage(
          failure.errorMessage,
          isError: true,
        );
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..trips.isLoading = false,
        ));
      }, (data) {
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..trips.isLoading = false
            ..trips.items.addAll(data)
            ..trips.currentPage = b.trips.currentPage! + 1
            ..trips.isFinished = data.isEmpty,
        ));
        if (!state.isListenerAdded) {
          controller.addListener(() {
            if (state.trips.shouldGetMoreData(controller)) {
              getAvailableTrips();
            }
          });
          emit(state.rebuild((b) => b..isListenerAdded = true));
        }
      });
    }, transformer: droppable());
  }
}
