import '../../generated/l10n.dart';
import 'app_enums.dart';

class Constant {
  Constant._();

  static final Map<int, TripStatus> tripStatusMap = {
    0: TripStatus.waiting,
    1: TripStatus.onWayToPickupRider,
    2: TripStatus.driverArrivedToPickupRider,
    3: TripStatus.delivering,
    4: TripStatus.delivered,
    5: TripStatus.cancelled,
  };

  static final Map<TripStatus, String> tripStatusStringMap = {
    TripStatus.onWayToPickupRider: S.current.driverArrivedToPickUpRider,
    TripStatus.driverArrivedToPickupRider: "${S.current.tripInProgress} 🚕",
    TripStatus.delivering: "${S.current.tripCompletedSuccessfully} ✅",
  };
}

class LocalStorageKeys {
  LocalStorageKeys._();

  static String appLanguage = 'appLanguage';
  static String userToken = 'userToken';
  static String phoneNumber = 'phoneNumber';
  static String password = 'password';
  static String isPhoneNumberVerified = 'isPhoneNumberVerified';
  static String isVehicleRegistered = 'isVehicleRegistered';
}
