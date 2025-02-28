import 'package:flutter/material.dart';

import '../../../main/data/models/trip_model.dart';
import 'map_collapsed_sliding_panel.dart';
import 'trip_details.dart';

class MapPanel extends StatelessWidget {
  final TripModel? trip;
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
            showAcceptTripButton: trip?.tripStatus == null,
          );
  }
}
