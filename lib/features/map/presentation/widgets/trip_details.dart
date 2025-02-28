import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../../main/data/models/trip_model.dart';
import '../bloc/map_bloc.dart';
import 'map_trip_tile.dart';

class TripDetails extends StatelessWidget {
  final TripModel? trip;

  const TripDetails({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: trip == null
          ? const Loader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MapTripTile(
                  title: S.of(context).tripNumber,
                  subtitle: trip!.id.toString(),
                  icon: Icons.confirmation_number_outlined,
                ),
                if (trip!.pickUpAddress.administrativeArea != null)
                  MapTripTile(
                    title: S.of(context).from,
                    subtitle:
                        '${trip!.pickUpAddress.administrativeArea}, ${trip!.pickUpAddress.locality}, ${trip!.pickUpAddress.street}',
                    icon: Icons.abc,
                    subtitleMaxLine: 2,
                  ),
                if (trip!.dropOffAddress.administrativeArea != null)
                  MapTripTile(
                    title: S.of(context).to,
                    subtitle:
                        '${trip!.dropOffAddress.administrativeArea}, ${trip!.dropOffAddress.locality}, ${trip!.dropOffAddress.street}',
                    icon: Icons.abc,
                    subtitleMaxLine: 2,
                  ),
                MapTripTile(
                  title: S.of(context).estimatedTime,
                  subtitle: S
                      .of(context)
                      .minute(trip!.calculatedDuration.removeDecimalZero()),
                  icon: Icons.access_time,
                ),
                MapTripTile(
                  title: S.of(context).distance,
                  subtitle: S
                      .of(context)
                      .km(trip!.calculatedDistance.removeDecimalZero()),
                  icon: Icons.directions_car,
                ),
                if (trip!.captainProfit != null)
                  MapTripTile(
                    title: S.of(context).yourProfits,
                    subtitle: S
                        .of(context)
                        .syr(trip!.captainProfit!.removeDecimalZero()),
                    icon: Icons.attach_money,
                  ),
                MapTripTile(
                  title: S.of(context).date,
                  subtitle: trip!.createdAt.convertToStringDateTime(),
                  icon: Icons.calendar_today,
                ),
                const Spacer(),
                AppTextButton(
                  onPressed: () {
                    if (trip!.tripStatus == null) {
                      context.read<MapBloc>().acceptTrip(trip!.id);
                    } else {
                      context.read<MapBloc>().changeIsPanelOpenState(false);
                      context.read<MapBloc>().panelController.close();
                    }
                  },
                  borderRadius: 15,
                  outerPadding: const EdgeInsets.only(bottom: 33),
                  child: Text(
                    trip!.tripStatus == null
                        ? S.of(context).acceptTrip
                        : S.of(context).cancel,
                    style: TextStyles.font16WhiteRegular,
                  ),
                ),
              ],
            ),
    );
  }
}
