import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/map_bloc.dart';

class DeliverMap extends StatelessWidget {
  final Set<Marker> markers;

  const DeliverMap({super.key, required this.markers});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(
        target: LatLng(33.51385233503283, 36.27651985734701),
        zoom: 15,
      ),
      zoomControlsEnabled: false,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        context.read<MapBloc>().mapCompleter.complete(controller);
      },
    );
  }
}
