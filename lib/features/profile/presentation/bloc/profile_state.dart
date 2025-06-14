import 'package:built_value/built_value.dart';

import '../../../../core/utils/app_enums.dart';
import '../../domain/entities/profile.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  bool get isLoading;

  Profile? get profile;

  BlocStatus get logoutStatus;

  ProfileState._();

  factory ProfileState([void Function(ProfileStateBuilder) updates]) =
      _$ProfileState;

  factory ProfileState.initial() => ProfileState(
    (b) => b
      ..isLoading = false
      ..profile = null
      ..logoutStatus = BlocStatus.initial,
  );
}
