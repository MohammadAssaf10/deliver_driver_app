import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';
import 'custom_auto_size_text.dart';

class TripTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const TripTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: ColorsManager.darkGrey.withValues(alpha: 0.8),
          ),
          const SizedBox(width: 6),
          CustomAutoSizeText(
            text: "$title: ",
            minFontSize: 14,
            initialFontSize: 16,
            maxFontSize: 18,
            fontWeight: FontWeightHelper.bold,
            color: ColorsManager.darkGrey,
          ),
          Expanded(
            child: CustomAutoSizeText(
              text: subtitle,
              minFontSize: 14,
              initialFontSize: 16,
              maxFontSize: 18,
              color: ColorsManager.darkGrey,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
