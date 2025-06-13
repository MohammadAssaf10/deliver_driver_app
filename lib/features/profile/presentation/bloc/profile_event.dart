import 'package:built_value/built_value.dart';

part 'profile_event.g.dart';

abstract class ProfileEvent {}

abstract class GetProfile extends ProfileEvent
    implements Built<GetProfile, GetProfileBuilder> {
  GetProfile._();
  factory GetProfile([void Function(GetProfileBuilder) updates]) = _$GetProfile;
}

abstract class Logout extends ProfileEvent
    implements Built<Logout, LogoutBuilder> {
  Logout._();
  factory Logout([void Function(LogoutBuilder) updates]) = _$Logout;
}
