import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';

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
          Text(
            "$title: ",
            style: TextStyle(
              fontSize: 16,
              color: ColorsManager.darkGrey,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: ColorsManager.darkGrey,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
