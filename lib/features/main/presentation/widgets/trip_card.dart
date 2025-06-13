import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final EdgeInsetsGeometry? margin;

  const TripCard({super.key, required this.trip, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.mapPage, arguments: trip);
      },
      child: Container(
        height: 215,
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
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3,
                    children: [
                      if (trip.status == null) const Spacer(),
                      TripTile(
                        title: S.of(context).tripNumber,
                        subtitle: trip.id.toString(),
                        icon: Icons.confirmation_number_outlined,
                      ),
                      if (trip.status != null)
                        TripTile(
                          title: S.of(context).status,
                          subtitle: trip.status!.name,
                          icon: Icons.info_outline,
                        ),
                      TripTile(
                        title: S.of(context).estimatedTime,
                        subtitle: S
                            .of(context)
                            .minute(
                              trip.calculatedDuration.removeDecimalZero(),
                            ),
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
                        subtitle: trip.createdDate.convertToStringDateTime(),
                        icon: Icons.calendar_today,
                      ),
                      if (trip.status == null) ...[
                        const Spacer(),
                        AppTextButton(
                          onPressed: () {
                            context.read<HomeBloc>().acceptTrip(trip.id);
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
