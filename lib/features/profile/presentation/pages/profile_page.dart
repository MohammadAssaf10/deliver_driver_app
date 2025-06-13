import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../../main/presentation/widgets/main_app_bar.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';
import '../widgets/profile_button.dart';
import '../widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppBar(title: S.of(context).account),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.isLoading || state.profile == null
                ? const Expanded(child: Loader(color: ColorsManager.darkWhite))
                : Column(
                    children: [
                      ProfileCard(profile: state.profile!),
                      const SizedBox(height: 100),
                      ProfileButton(
                        onPressed: () {},
                        title: S.of(context).profileDetails,
                      ),
                      ProfileButton(
                        onPressed: () {},
                        title: S.of(context).changeLanguage,
                      ),
                      ProfileButton(
                        onPressed: () {},
                        title: S.of(context).logout,
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
