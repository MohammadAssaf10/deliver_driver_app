import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../../../../core/widget/loader.dart';
import '../../../main/presentation/widgets/trip_card.dart';
import '../../domain/entities/history.dart';
import '../bloc/activities_bloc.dart';
import 'history_trip_card.dart';

class HistoryTabView extends StatelessWidget {
  final BlocStatus status;
  final List<History> tripsHistory;
  const HistoryTabView({
    super.key,
    required this.status,
    required this.tripsHistory,
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
            itemCount: tripsHistory.length,
            itemBuilder: (context, index) {
              return HistoryTripCard(
                trip: tripsHistory[index],
                margin: const EdgeInsets.symmetric(horizontal: 14),
              );
            },
          );
  }
}
