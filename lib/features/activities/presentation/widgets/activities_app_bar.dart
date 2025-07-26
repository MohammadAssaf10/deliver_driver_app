import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ActivitiesAppBar extends StatelessWidget {
  final TabController tabController;
  const ActivitiesAppBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: AppBar(
        toolbarHeight: 80,
        titleTextStyle: TextStyles.font33DarkWhiteBold,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            S.of(context).account,
            style: TextStyles.font33DarkWhiteBold,
            textAlign: TextAlign.start,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          dividerColor: ColorsManager.darkWhite,
          indicatorColor: ColorsManager.white,
          unselectedLabelColor: ColorsManager.darkWhite,
          labelColor: ColorsManager.white,
          tabAlignment: TabAlignment.fill,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(vertical: 6),
          indicatorWeight: 1,
          dividerHeight: 1,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyles.font16WhiteMedium,
          unselectedLabelStyle: TextStyles.font15DarkWhiteRegular,
          overlayColor: WidgetStatePropertyAll(
            ColorsManager.darkWhite.withValues(alpha: 0.1),
          ),
          tabs: [Text(S.of(context).history), Text(S.of(context).financial)],
        ),
      ),
    );
  }
}
