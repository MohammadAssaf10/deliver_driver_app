import 'package:deliver_driver_app/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../generated/l10n.dart';
import '../bloc/map_bloc.dart';

class ConfirmDialog extends StatelessWidget {
  final String newStatus;

  const ConfirmDialog({
    super.key,
    required this.newStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: ColorsManager.darkWhite,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.confirmChanged,
              style: TextStyles.font18DarkGreyBold,
            ),
            const SizedBox(height: 16),
            Text(
              S.current.changeStatusTo(newStatus),
              textAlign: TextAlign.center,
              style: TextStyles.font16DarkGreyRegular,
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      context.pop();
                    },
                    backgroundColor: ColorsManager.darkWhite,
                    borderSide: const BorderSide(color: ColorsManager.darkGrey),
                    child: Text(
                      S.current.cancel,
                      style: TextStyles.font16DarkGreyRegular,
                    ),
                  ),
                ),
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      context.pop();
                      if (context.read<MapBloc>().state.currentAddress ==
                          null) {
                        context.read<MapBloc>().getCurrentLocation(
                            onComplete: () {
                          context.read<MapBloc>().changeTripStatusToNext();
                        });
                      } else {
                        context.read<MapBloc>().changeTripStatusToNext();
                      }
                    },
                    child: Text(
                      S.current.confirm,
                      style: TextStyles.font16DarkWhiteRegular,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
