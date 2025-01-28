import 'package:flutter/material.dart';

import '../../domain/entities/current_trip.dart';

class UserHaveTripWidget extends StatelessWidget {
  final CurrentTrip currentTrip;

  const UserHaveTripWidget({
    super.key,
    required this.currentTrip,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Text(
          //     S.of(context).currentTrip,
          //     style: TextStyles.font25DarkWhiteBold,
          //   ),
          // ),
          // CurrentTripCard(currentTrip: currentTrip),
        ],
      ),
    );
  }
}
