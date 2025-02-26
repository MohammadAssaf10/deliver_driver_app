import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';
import '../bloc/register_vehicle_bloc.dart';
import '../bloc/register_vehicle_state.dart';
import '../widgets/register_vehicle_bloc_listener.dart';
import '../widgets/select_image_container.dart';

class RegisterVehiclePage extends StatelessWidget {
  const RegisterVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.customWhite,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: BlocBuilder<RegisterVehicleBloc, RegisterVehicleState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RegisterVehicleBlocListener(),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
                  // const SelectProfileImage(),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                  CustomAutoSizeText(
                    text: S.of(context).selectVehicleImages,
                    minFontSize: 16,
                    initialFontSize: 18,
                    maxFontSize: 20,
                    color: ColorsManager.darkGrey,
                    fontWeight: FontWeightHelper.bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SelectImageContainer(
                    onPress: (imageSource) {
                      context
                          .read<RegisterVehicleBloc>()
                          .selectLicenseImage(imageSource);
                    },
                    title: state.licenseImage == null
                        ? S.of(context).licenseImage
                        : state.licenseImage!.name,
                  ),
                  SelectImageContainer(
                    onPress: (imageSource) {
                      context
                          .read<RegisterVehicleBloc>()
                          .selectVehicleImage(imageSource);
                    },
                    title: state.vehicleImage == null
                        ? S.of(context).vehicleImage
                        : state.vehicleImage!.name,
                  ),
                  const SizedBox(height: 20),
                  AppTextButton(
                    onPressed: () {
                      if (state.licenseImage != null &&
                          state.vehicleImage != null) {
                        context.read<RegisterVehicleBloc>().registerVehicle();
                      } else {
                        showToastMessage(
                            S.of(context).pleaseSelectVehicleImages);
                      }
                    },
                    borderRadius: 10,
                    child: CustomAutoSizeText(
                      text: S.of(context).confirm,
                      minFontSize: 12,
                      initialFontSize: 14,
                      maxFontSize: 16,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
