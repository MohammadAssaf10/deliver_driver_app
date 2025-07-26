import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di.dart';
import '../../../activities/presentation/bloc/activities_bloc.dart';
import '../../../activities/presentation/pages/activities_page.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  final PageController pageController = PageController();

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  final List<Widget> pages = [
    BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..getCurrentTrip()
        ..getCurrentLocation(),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => getIt<ActivitiesBloc>()..getDriverTripsHistory(),
      child: const ActivitiesPage(),
    ),
    BlocProvider(
      create: (context) => getIt<ProfileBloc>()..getProfile(),
      child: const ProfilePage(),
    ),
  ];

  MainCubit() : super(MainState.initial());

  void setPageIndex(int pageIndex) {
    emit(state.rebuild((b) => b..pageIndex = pageIndex));
  }
}
