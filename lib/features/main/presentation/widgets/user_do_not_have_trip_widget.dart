import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import 'main_app_bar.dart';
import 'trip_card.dart';

class UserDoNotHaveTripWidget extends StatelessWidget {
  final PaginationStateData<Trip> trips;
  final BlocStatus status;

  const UserDoNotHaveTripWidget({
    super.key,
    required this.trips,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppBar(title: S.of(context).availableTrips),
        if (status == BlocStatus.loading)
          const Expanded(child: Loader(color: ColorsManager.customWhite)),
        if (status == BlocStatus.error)
          CustomErrorWidget(
            errorMessage: S.of(context).oopsSomethingWentWrongPleaseTryAgain,
            onRetry: () {
              context.read<HomeBloc>().getCurrentTrip();
            },
          ),
        if (trips.items.isNotEmpty)
          Expanded(
            child: ListView.builder(
              controller: context.read<HomeBloc>().controller,
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
