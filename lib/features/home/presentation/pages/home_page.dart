import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../../../main/presentation/widgets/main_app_bar.dart';
import '../../../main/presentation/widgets/trip_card.dart';
import '../../../main/presentation/widgets/user_do_not_have_trip_widget.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.acceptTripStatus == BlocStatus.loading) {
          showLoadingDialog(context, loaderColor: ColorsManager.customWhite);
        } else if (state.acceptTripStatus == BlocStatus.error ||
            state.acceptTripStatus == BlocStatus.success) {
          closeLoadingDialogIfVisible();
        }
      },
      builder: (context, state) {
        return state.currentTrip == null
            ? UserDoNotHaveTripWidget(
                trips: state.trips,
                status: state.tripStatus,
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
