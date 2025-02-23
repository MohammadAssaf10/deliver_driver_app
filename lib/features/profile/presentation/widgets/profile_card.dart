import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/assets.dart';
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
          padding: EdgeInsets.all(5),
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
        SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              ProfileTile(
                title: "Driver ID: ",
                subTitle: profile.userId.toString(),
              ),
              ProfileTile(
                title: "Name: ",
                subTitle: profile.name,
              ),
              ProfileTile(
                title: "Phone: ",
                subTitle: profile.phone,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
