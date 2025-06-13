import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_state.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/trip_card.dart';
import '../widgets/user_do_not_have_trip_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state.acceptTripIsLoading == true) {
          showLoadingDialog(context);
        } else if (state.acceptTripIsLoading == false) {
          closeLoadingDialogIfVisible();
        }
      },
      builder: (context, state) {
        return state.currentTrip == null
            ? UserDoNotHaveTripWidget(
                trips: state.trips,
                isLoading: state.isLoading,
                isError: state.isError,
              )
            : Column(
                children: [
                  MainAppBar(title: S.of(context).currentTrip),
                  TripCard(
                    trip: state.currentTrip!,
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                ],
              );
      },
    );
  }
}
