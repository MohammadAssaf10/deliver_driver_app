import 'package:deliver_driver_app/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class TripCard extends StatelessWidget {
  final int tripNumber;
  final double estimatedTime;
  final double distance;
  final String date;
  final TripStatus? status;
  final double? profitForCaptain;
  final EdgeInsetsGeometry? margin;

  const TripCard({
    super.key,
    required this.tripNumber,
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
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: ColorsManager.customPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: margin,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TripTile(
                      title: S.of(context).tripNumber,
                      subtitle: tripNumber.toString(),
                    ),
                    if (status != null)
                      TripTile(
                        title: S.of(context).status,
                        subtitle: status!.name,
                      ),
                    TripTile(
                      title: S.of(context).estimatedTime,
                      subtitle: S
                          .of(context)
                          .minute(estimatedTime.removeDecimalZero()),
                    ),
                    TripTile(
                      title: S.of(context).distance,
                      subtitle: S.of(context).km(distance.removeDecimalZero()),
                    ),
                    if (profitForCaptain != null)
                      TripTile(
                        title: S.of(context).profitForCaptain,
                        subtitle: profitForCaptain.toString(),
                      ),
                    TripTile(
                      title: S.of(context).date,
                      subtitle: date,
                    ),
                    AppTextButton(
                      onPressed: () {},
                      borderRadius: 15,
                      buttonHeight: 40,
                      child: CustomAutoSizeText(
                        text: 'Accept trip',
                        minFontSize: 12,
                        initialFontSize: 14,
                        maxFontSize: 16,
                        color: ColorsManager.darkWhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              Assets.imagesPickupImage,
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: 192,
            )
          ],
        ),
      ),
    );
  }
}
