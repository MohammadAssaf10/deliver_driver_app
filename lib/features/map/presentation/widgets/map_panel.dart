import 'package:flutter/material.dart';

import '../../../../core/entities/trip.dart';
import 'map_collapsed_sliding_panel.dart';
import 'trip_details.dart';

class MapPanel extends StatelessWidget {
  final Trip? trip;
  final bool isPanelOpen;

  const MapPanel({
    super.key,
    required this.trip,
    required this.isPanelOpen,
  });

  @override
  Widget build(BuildContext context) {
    return isPanelOpen
        ? TripDetails(trip: trip)
        : MapCollapsedSlidingPanel(
            tripId: trip?.id,
            tripStatus: trip?.status,
          );
  }
}
