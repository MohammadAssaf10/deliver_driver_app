class Endpoints {
  Endpoints._();

  static String baseUrl = 'http://145.223.101.137:8080/v1';

  static String signIn = '/driver/signin';
  static String signUp = '/driver/signup';

  static String verifyPhoneNumber = '/Account/verifyPhone';
  static String currentTrip = '/driver/trip/current';
  static String availableTrips = '/driver/trip/available';
  static String acceptTrip = '/driver/trip/accept';
  static String profile = '/driver/profile';
  static String registerVehicle = '/driver/profile/registerVehicle';
  static String nextTripStatus = '/driver/trip/next';
  static String finance = '/driver/finance';
  static String history = '/driver/trip/history';
  static String generateVerificationCode = '/Account/generateVerificationCode';
  static String getVerificationCode = '/Account/getVerificationCode';
}
