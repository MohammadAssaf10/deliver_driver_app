import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../bloc/map_bloc.dart';
import '../bloc/map_state.dart';
import '../widgets/deliver_map.dart';
import '../widgets/map_panel.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          if (state.acceptTripIsLoading || state.isLoading) {
            showLoadingDialog(context);
          } else if (!state.acceptTripIsLoading || !state.isLoading) {
            closeLoadingDialogIfVisible();
          }
        },
        builder: (context, state) {
          return PopScope(
            // Allow popping only when panel is closed
            canPop: !state.isPanelOpen,
            // Handle back button press
            onPopInvokedWithResult: (bool didPop, _) {
              if (!didPop && state.isPanelOpen) {
                // Close panel if pop was prevented and panel is open
                context.read<MapBloc>().panelController.close();
              }
            },
            child: SlidingUpPanel(
              controller: context.read<MapBloc>().panelController,
              minHeight: state.trip?.status == TripStatus.delivered ? 80 : 135,
              maxHeight: 330,
              backdropEnabled: true,
              borderRadius: BorderRadius.circular(15),
              panel: MapPanel(
                trip: state.trip,
                isPanelOpen: state.isPanelOpen,
              ),
              onPanelSlide: (position) {
                if (position >= 0.9) {
                  context.read<MapBloc>().changeIsPanelOpenState(true);
                } else if (position <= 0.1) {
                  context.read<MapBloc>().changeIsPanelOpenState(false);
                }
              },
              isDraggable: false,
              padding: const EdgeInsets.all(15),
              body: DeliverMap(
                markers: state.markers.toSet(),
              ),
            ),
          );
        },
      ),
    );
  }
}
