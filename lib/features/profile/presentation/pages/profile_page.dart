import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/bloc/app_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_functions.dart';
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
        BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state.logoutStatus == BlocStatus.loading) {
              showLoadingDialog(context);
            } else if (state.logoutStatus == BlocStatus.error) {
              closeLoadingDialogIfVisible();
            } else if (state.logoutStatus == BlocStatus.success) {
              closeLoadingDialogIfVisible();
              context.pushNamedAndRemoveUntil(
                Routes.signInPage,
                predicate: (_) => false,
              );
            }
          },
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
                        onPressed: () {
                          context.read<AppCubit>().changeAppLanguage();
                        },
                        title: S.of(context).changeLanguage,
                      ),
                      ProfileButton(
                        onPressed: () {
                          context.read<ProfileBloc>().logout();
                        },
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
