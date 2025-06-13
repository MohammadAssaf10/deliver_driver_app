import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../bloc/activities_bloc.dart';
import '../bloc/activities_state.dart';
import '../widgets/activities_app_bar.dart';

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
    _tabController = TabController(length: 2, vsync: this);
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
                  Container(color: Colors.amber),
                  state.financialStatus == BlocStatus.loading
                      ? const Loader()
                      : ListView.builder(
                          itemCount: state.financial!.payments.length,
                          padding: const EdgeInsets.all(14),
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 2.4,
                              child: TicketWidget(
                                width: double.infinity,
                                height: 100,
                                isCornerRounded: true,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                color: ColorsManager.darkWhite,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        start: 30,
                                      ),
                                      child: Text(
                                        "${S.of(context).tripId}\n${state.financial!.payments[index].tripId}",
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyles.font16DarkGreySemiBold,
                                      ),
                                    ),
                                    Container(
                                      width: 1.5,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorsManager.darkGrey,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${S.of(context).date}: ${state.financial!.payments[index].createdDate.toInt().convertToStringDateTime()}',
                                          ),
                                          Text(
                                            '${S.of(context).value}: ${state.financial!.payments[index].value.toInt()}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
