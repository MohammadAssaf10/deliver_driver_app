import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/assets.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';
import '../widgets/profile_card.dart';
import '../widgets/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.isLoading || state.profile == null
              ? Center(
                  child: Loader(
                    color: ColorsManager.darkWhite,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileCard(profile: state.profile!),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
