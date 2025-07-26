import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MainAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorsManager.darkWhite)),
      ),
      child: AppBar(
        toolbarHeight: 110,
        titleTextStyle: TextStyles.font33DarkWhiteBold,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            title,
            // state.pageIndex == 0
            //     ? state.currentTrip == null
            //           ? S.of(context).availableTrips
            //           : S.of(context).currentTrip
            //     : state.pageIndex == 1
            //     ? S.of(context).activities
            //     : S.of(context).account,
            style: TextStyles.font33DarkWhiteBold,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
