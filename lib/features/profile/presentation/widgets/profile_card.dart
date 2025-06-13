import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/profile.dart';
import 'profile_tile.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 85,
          height: 85,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorsManager.lightGrey,
            ),
          ),
          child: Image.asset(
            Assets.iconsDriverIcon,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              ProfileTile(
                title: S.of(context).driverId,
                subTitle: profile.userId.toString(),
              ),
              ProfileTile(
                title: S.of(context).name,
                subTitle: profile.name,
              ),
              ProfileTile(
                title: S.of(context).phone,
                subTitle: profile.phone,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
