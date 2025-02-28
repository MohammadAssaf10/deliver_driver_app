import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/map_bloc.dart';

class MapCollapsedSlidingPanel extends StatelessWidget {
  final int? tripId;
  final bool showAcceptTripButton;

  const MapCollapsedSlidingPanel({
    super.key,
    required this.tripId,
    required this.showAcceptTripButton,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Expanded(
            child: AppTextButton(
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
          ),
          if(showAcceptTripButton)
          Expanded(
            child: AppTextButton(
              onPressed: () {
                if (tripId != null) {
                  context.read<MapBloc>().acceptTrip(tripId!);
                }
              },
              borderRadius: 15,
              outerPadding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                S.of(context).acceptTrip,
                style: TextStyles.font16WhiteRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
