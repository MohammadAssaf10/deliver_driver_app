import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/verification_code_bloc.dart';
import '../widgets/verification_code_fields.dart';
import '../widgets/verification_code_listener.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.customWhite,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerificationCodeListener(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
              const Icon(
                Icons.verified,
                size: 100,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              Text(
                S.of(context).weSentOTPCodeToVerifyYourNumber,
                style: TextStyles.font18BlackBold,
              ),
              const SizedBox(height: 20),
              const VerificationCodeFields(),
              const SizedBox(height: 20),
              AppTextButton(
                onPressed: () {
                  if (context
                      .read<VerificationCodeBloc>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<VerificationCodeBloc>().verifyPhoneNumber();
                  }
                },
                buttonText: S.of(context).confirm,
                textStyle: TextStyles.font14WhiteRegular,
                borderRadius: 10,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
