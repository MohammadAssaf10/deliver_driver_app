import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/financial.dart';
import '../bloc/activities_bloc.dart';

class FinancialTabView extends StatelessWidget {
  final BlocStatus status;
  final Financial? financial;
  const FinancialTabView({
    super.key,
    required this.status,
    required this.financial,
  });

  @override
  Widget build(BuildContext context) {
    return status == BlocStatus.loading
        ? const Loader(color: ColorsManager.customWhite)
        : status == BlocStatus.error
        ? CustomErrorWidget(
            onRetry: () {
              context.read<ActivitiesBloc>().getDriverFinancialHistory();
            },
          )
        : ListView.builder(
            itemCount: financial!.payments.length,
            padding: const EdgeInsets.all(14),
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 2.4,
                child: TicketWidget(
                  width: double.infinity,
                  height: 100,
                  isCornerRounded: true,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: ColorsManager.darkWhite,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "${S.of(context).tripId}\n${financial!.payments[index].tripId}",
                          textAlign: TextAlign.center,
                          style: TextStyles.font16DarkGreySemiBold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsetsDirectional.only(start: 15),
                          decoration: const BoxDecoration(
                            border: BorderDirectional(
                              start: BorderSide(
                                color: ColorsManager.darkGrey,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${S.of(context).date}: ${financial!.payments[index].createdDate.toInt().convertToStringDateTime()}',
                                style: TextStyles.font15DarkWhiteMedium,
                                maxLines: 1,
                              ),
                              Text(
                                '${S.of(context).value}: ${S.of(context).syr(financial!.payments[index].value.toInt().toString())}',
                                style: TextStyles.font15DarkWhiteMedium,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
