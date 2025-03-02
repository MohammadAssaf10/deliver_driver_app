import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/map_bloc.dart';
import 'confirm_dialog.dart';

class MapCollapsedSlidingPanel extends StatelessWidget {
  final int? tripId;
  final TripStatus? tripStatus;

  const MapCollapsedSlidingPanel({
    super.key,
    required this.tripId,
    required this.tripStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        spacing: 8,
        children: [
          AppTextButton(
            onPressed: () {
              context.read<MapBloc>().panelController.open();
            },
            borderRadius: 15,
            outerPadding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              S.of(context).tripDetails,
              style: TextStyles.font16WhiteRegular,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          if (tripStatus == null || tripStatus != TripStatus.delivered)
            AppTextButton(
              onPressed: () {
                if (tripId != null && tripStatus == null) {
                  if (context.read<MapBloc>().state.currentAddress == null) {
                    context.read<MapBloc>().getCurrentLocation(onComplete: () {
                      context.read<MapBloc>().acceptTrip(tripId!);
                    });
                  } else {
                    context.read<MapBloc>().acceptTrip(tripId!);
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider<MapBloc>.value(
                      value: context.read<MapBloc>(),
                      child: ConfirmDialog(
                        newStatus:
                            Constant.tripStatusStringMap[tripStatus] ?? '',
                      ),
                    ),
                  );
                }
              },
              borderRadius: 15,
              outerPadding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                tripStatus == null
                    ? S.of(context).acceptTrip
                    : Constant.tripStatusStringMap[tripStatus] ?? '',
                style: TextStyles.font16WhiteRegular,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
