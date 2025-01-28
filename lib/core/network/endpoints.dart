class Endpoints {
  Endpoints._();

  static String baseUrl = 'http://145.223.101.137:8080/v1';

  static String signIn = '/driver/signin';
  static String signUp = '/driver/signup';
  static String generateVerificationCode = '/Account/generateVerificationCode';
  static String getVerificationCode = '/Account/getVerificationCode';
  static String verifyPhoneNumber = '/Account/verifyPhone';
  static String currentTrip = '/driver/trip/current';
  static String availableTrips = '/driver/trip/available';
  static String acceptTrip = '/driver/trip/accept';
}
