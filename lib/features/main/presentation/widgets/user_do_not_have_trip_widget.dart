import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/pagination_state_data.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/loader.dart';
import '../../data/models/trip_model.dart';
import '../bloc/main_bloc.dart';
import 'trip_card.dart';

class UserDoNotHaveTripWidget extends StatelessWidget {
  final PaginationStateData<TripModel> trips;

  const UserDoNotHaveTripWidget({
    super.key,
    required this.trips,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: context.read<MainBloc>().controller,
      itemCount: trips.isFinished || !trips.isLoading
          ? trips.items.length
          : trips.items.length + 1,
      itemBuilder: (context, index) {
        return index >= trips.items.length
            ? Loader(
                padding: EdgeInsets.symmetric(vertical: 4),
                color: ColorsManager.customWhite,
              )
            : TripCard(
                tripNumber: trips.items[index].id,
                estimatedTime: trips.items[index].calculatedDuration,
                distance: trips.items[index].calculatedDistance,
                profitForCaptain: trips.items[index].captainProfit,
                date: '',
                margin: EdgeInsets.only(
                  top: index == 0 ? 0 : 5,
                  bottom: index == trips.items.length ? 0 : 5,
                ),
              );
      },
    );
  }
}
