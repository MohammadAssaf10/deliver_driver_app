import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../data/repositories/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  void getProfile() => add(GetProfile());

  void logout() => add(Logout());

  ProfileBloc(this._profileRepository) : super(ProfileState.initial()) {
    on<GetProfile>((event, emit) async {
      emit(
        state.rebuild(
          (b) => b
            ..isLoading = true
            ..profile = null,
        ),
      );
      final result = await _profileRepository.getProfile();
      result.fold(
        (failure) {
          emit(state.rebuild((b) => b..isLoading = false));
        },
        (data) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..profile = data,
            ),
          );
        },
      );
    });
    on<Logout>((event, emit) async {
      emit(state.rebuild((b) => b..logoutStatus = BlocStatus.loading));
      final result = await _profileRepository.logout();
      result.fold(
        (failure) {
          showToastMessage(failure.errorMessage, isError: true);
          emit(state.rebuild((b) => b..logoutStatus = BlocStatus.error));
        },
        (message) {
          showToastMessage(message);
          emit(state.rebuild((b) => b..logoutStatus = BlocStatus.success));
        },
      );
      emit(state.rebuild((b) => b..logoutStatus = BlocStatus.initial));
    });
  }
}
