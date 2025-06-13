import 'package:deliver_driver_app/features/main/presentation/widgets/main_app_bar.dart';
import 'package:deliver_driver_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../../../../core/widget/loader.dart';
import '../bloc/main_bloc.dart';
import 'trip_card.dart';

class UserDoNotHaveTripWidget extends StatelessWidget {
  final PaginationStateData<Trip> trips;
  final bool isLoading;
  final bool isError;

  const UserDoNotHaveTripWidget({
    super.key,
    required this.trips,
    required this.isLoading,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppBar(title: S.of(context).availableTrips),
        if (isLoading)
          const Expanded(child: Loader(color: ColorsManager.customWhite)),
        if (isError)
          CustomErrorWidget(
            errorMessage: S.of(context).oopsSomethingWentWrongPleaseTryAgain,
            onRetry: () {
              context.read<MainBloc>().getCurrentTrip();
            },
          ),
        if (trips.items.isNotEmpty)
          Expanded(
            child: ListView.builder(
              controller: context.read<MainBloc>().controller,
              itemCount: trips.isFinished || !trips.isLoading
                  ? trips.items.length
                  : trips.items.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemBuilder: (context, index) {
                return index >= trips.items.length
                    ? const Loader(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        color: ColorsManager.customWhite,
                      )
                    : TripCard(
                        trip: trips.items[index],
                        margin: EdgeInsets.only(
                          top: index == 0 ? 0 : 5,
                          bottom: index == trips.items.length ? 0 : 5,
                        ),
                      );
              },
            ),
          ),
      ],
    );
  }
}
