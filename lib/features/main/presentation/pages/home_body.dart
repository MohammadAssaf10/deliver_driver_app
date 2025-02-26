import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_state.dart';
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: state.isLoading
              ? const Loader(
                  color: ColorsManager.customWhite,
                )
              : state.isError
                  ? CustomErrorWidget(
                      errorMessage:
                          S.of(context).oopsSomethingWentWrongPleaseTryAgain,
                      onRetry: () {
                        context.read<MainBloc>().getCurrentTrip();
                      },
                    )
                  : state.currentTrip == null
                      ? UserDoNotHaveTripWidget(trips: state.trips)
                      : Align(
                          alignment: AlignmentDirectional.topStart,
                          child: TripCard(
                            tripId: state.currentTrip!.id,
                            estimatedTime:
                                state.currentTrip!.calculatedDuration,
                            date: state.currentTrip!.createdDate,
                            distance: state.currentTrip!.calculatedDistance,
                            margin: EdgeInsets.zero,
                          ),
                        ),
        );
      },
    );
  }
}
