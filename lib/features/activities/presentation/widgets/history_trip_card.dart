import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/history.dart';

class HistoryTripCard extends StatelessWidget {
  final History trip;
  final EdgeInsetsGeometry? margin;

  const HistoryTripCard({super.key, required this.trip, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      width: double.infinity,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorsManager.customPurple,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            ColorsManager.customPurple.withValues(alpha: 0.9),
            ColorsManager.customPurple.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3,
                  children: [
                    TripTile(
                      title: S.of(context).tripNumber,
                      subtitle: trip.id.toString(),
                      icon: Icons.confirmation_number_outlined,
                    ),
                    TripTile(
                      title: S.of(context).status,
                      subtitle: trip.status.name,
                      icon: Icons.info_outline,
                    ),
                    TripTile(
                      title: S.of(context).estimatedTime,
                      subtitle: S
                          .of(context)
                          .minute(trip.calculatedDuration.removeDecimalZero()),
                      icon: Icons.access_time,
                    ),
                    TripTile(
                      title: S.of(context).distance,
                      subtitle: S
                          .of(context)
                          .km(trip.calculatedDistance.removeDecimalZero()),
                      icon: Icons.directions_car,
                    ),
                    TripTile(
                      title: S.of(context).date,
                      subtitle: trip.createdDate.convertToStringDateTime(),
                      icon: Icons.calendar_today,
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                Assets.imagesPickupImage,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width * 0.35,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
