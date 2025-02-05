import 'package:deliver_driver_app/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../bloc/main_bloc.dart';

class TripCard extends StatelessWidget {
  final int tripId;
  final double estimatedTime;
  final double distance;
  final String date;
  final TripStatus? status;
  final double? profitForCaptain;
  final EdgeInsetsGeometry? margin;

  const TripCard({
    super.key,
    required this.tripId,
    required this.estimatedTime,
    required this.distance,
    required this.date,
    this.status,
    this.margin,
    this.profitForCaptain,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    children: [
                      TripTile(
                        title: S.of(context).tripNumber,
                        subtitle: tripId.toString(),
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
                        subtitle: S
                            .of(context)
                            .minute(estimatedTime.removeDecimalZero()),
                        icon: Icons.access_time,
                      ),
                      TripTile(
                        title: S.of(context).distance,
                        subtitle:
                            S.of(context).km(distance.removeDecimalZero()),
                        icon: Icons.directions_car,
                      ),
                      if (profitForCaptain != null)
                        TripTile(
                          title: S.of(context).yourProfits,
                          subtitle: S
                              .of(context)
                              .syr(profitForCaptain!.removeDecimalZero()),
                          icon: Icons.attach_money,
                        ),
                      TripTile(
                        title: S.of(context).date,
                        subtitle: date,
                        icon: Icons.calendar_today,
                      ),
                      AppTextButton(
                        onPressed: () {
                          context.read<MainBloc>().acceptTrip(tripId);
                        },
                        borderRadius: 15,
                        buttonHeight: 40,
                        backgroundColor: ColorsManager.darkGrey,
                        child: CustomAutoSizeText(
                          text: 'Accept Trip',
                          minFontSize: 12,
                          initialFontSize: 14,
                          maxFontSize: 16,
                          color: ColorsManager.darkWhite,
                          fontWeight: FontWeight.bold,
                        ),
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
      ),
    );
  }
}
