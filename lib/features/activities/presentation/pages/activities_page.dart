import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activities_bloc.dart';
import '../bloc/activities_state.dart';
import '../widgets/activities_app_bar.dart';
import '../widgets/financial_tab_view.dart';
import '../widgets/history_tab_view.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (_tabController.index == 0) {
          context.read<ActivitiesBloc>().getDriverTripsHistory();
        } else if (_tabController.index == 1) {
          context.read<ActivitiesBloc>().getDriverFinancialHistory();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivitiesAppBar(tabController: _tabController),
        Expanded(
          child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
            builder: (context, state) {
              return TabBarView(
                controller: _tabController,
                children: [
                  HistoryTabView(
                    status: state.tripsHistoryStatus,
                    tripsHistory: state.tripsHistory.toList(),
                  ),
                  FinancialTabView(
                    status: state.financialStatus,
                    financial: state.financial,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
