import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class MapTripTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int subtitleMaxLine;
  final IconData? icon;
  final String? pngIcon;

  const MapTripTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.pngIcon,
    this.subtitleMaxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          if(icon != null)
          Icon(
            icon,
            size: 18,
            color: ColorsManager.darkGrey.withValues(alpha: 0.8),
          ),
          if(pngIcon != null)
            Image.asset(
            pngIcon!,
            width: 18,
          ),
          const SizedBox(width: 6),
          Text("$title: ", style: TextStyles.font16DarkGreySemiBold),
          Expanded(
            child: Text(
              subtitle,
              style: TextStyles.font16DarkGreyRegular,
              maxLines: subtitleMaxLine,
            ),
          ),
        ],
      ),
    );
  }
}
