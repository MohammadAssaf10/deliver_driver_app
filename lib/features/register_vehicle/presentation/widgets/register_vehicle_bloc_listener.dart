import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_functions.dart';
import '../bloc/register_vehicle_bloc.dart';
import '../bloc/register_vehicle_state.dart';

class RegisterVehicleBlocListener extends StatelessWidget {
  const RegisterVehicleBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterVehicleBloc, RegisterVehicleState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.mainPage,
            predicate: (_) => false,
          );
        } else if (state.isLoading) {
          showLoadingDialog(context);
        } else if (state.isError) {
          closeLoadingDialogIfVisible();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
