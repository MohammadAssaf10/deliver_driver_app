enum StringColor { black, red, green, yellow, blue, magenta, cyan, white }

enum BlocStatus { initial, loading, success, error }

enum Language { en, ar }

enum MarkerState {
  nullLocation,
  tripStartLocation,
  tripEndLocation,
  currentLocation,
}

enum TripStatus {
  waiting,
  onWayToPickupRider,
  driverArrivedToPickupRider,
  delivering,
  delivered,
  cancelled,
}
