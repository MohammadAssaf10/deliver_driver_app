import 'package:deliver_driver_app/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/trip_model.dart';
import '../bloc/main_bloc.dart';

class TripCard extends StatelessWidget {
  final TripModel trip;
  final TripStatus? status;
  final EdgeInsetsGeometry? margin;

  const TripCard({
    super.key,
    required this.trip,
    this.status,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.mapPage, arguments: trip);
      },
      child: Container(
        height: status != null ? 200 : 245,
        width: double.infinity,
        margin:
            margin ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      TripTile(
                        title: S.of(context).tripNumber,
                        subtitle: trip.id.toString(),
                        icon: Icons.confirmation_number_outlined,
                      ),
                      if (status != null)
                        TripTile(
                          title: S.of(context).status,
                          subtitle: status!.name,
                          icon: Icons.info_outline,
                        ),
                      TripTile(
                        title: S.of(context).estimatedTime,
                        subtitle: S.of(context).minute(
                            trip.calculatedDuration.removeDecimalZero()),
                        icon: Icons.access_time,
                      ),
                      TripTile(
                        title: S.of(context).distance,
                        subtitle: S
                            .of(context)
                            .km(trip.calculatedDistance.removeDecimalZero()),
                        icon: Icons.directions_car,
                      ),
                      if (trip.captainProfit != null)
                        TripTile(
                          title: S.of(context).yourProfits,
                          subtitle: S
                              .of(context)
                              .syr(trip.captainProfit!.removeDecimalZero()),
                          icon: Icons.attach_money,
                        ),
                      TripTile(
                        title: S.of(context).date,
                        subtitle: trip.createdAt.convertToStringDateTime(),
                        icon: Icons.calendar_today,
                      ),
                      if (status == null) ...[
                        const Spacer(),
                        AppTextButton(
                          onPressed: () {
                            context.read<MainBloc>().acceptTrip(trip.id);
                          },
                          borderRadius: 15,
                          buttonHeight: 40,
                          backgroundColor: ColorsManager.darkGrey,
                          outerPadding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            S.of(context).acceptTrip,
                            style: TextStyles.font14DarkWhiteSemiBold,
                          ),
                        ),
                      ],
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
      ),
    );
  }
}
