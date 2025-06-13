// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/data/data_sources/local/app_local_data_source.dart' as _i212;
import '../../app/data/data_sources/local/app_local_data_source_impl.dart'
    as _i746;
import '../../app/data/repositories/app_repository.dart' as _i245;
import '../../app/presentation/bloc/app_cubit.dart' as _i571;
import '../../features/activities/data/datasources/activities_remote_data_source.dart'
    as _i534;
import '../../features/activities/data/datasources/activities_remote_data_source_impl.dart'
    as _i187;
import '../../features/activities/data/repositories/activities_repository_impl.dart'
    as _i6;
import '../../features/activities/domain/repositories/activities_repository.dart'
    as _i415;
import '../../features/activities/presentation/bloc/activities_bloc.dart'
    as _i880;
import '../../features/main/data/data_sources/remote/main_remote_data_source.dart'
    as _i1003;
import '../../features/main/data/data_sources/remote/main_remote_data_source_impl.dart'
    as _i724;
import '../../features/main/data/repositories/main_repository_impl.dart'
    as _i411;
import '../../features/main/domain/accept_trip_use_case.dart' as _i641;
import '../../features/main/domain/repositories/main_repository.dart' as _i298;
import '../../features/main/presentation/bloc/main_bloc.dart' as _i1014;
import '../../features/map/data/data_sources/remote/map_remote_data_source.dart'
    as _i590;
import '../../features/map/data/data_sources/remote/map_remote_data_source_impl.dart'
    as _i935;
import '../../features/map/data/repositories/map_repository.dart' as _i126;
import '../../features/map/presentation/bloc/map_bloc.dart' as _i437;
import '../../features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i1012;
import '../../features/profile/data/data_sources/profile_remote_data_source_impl.dart'
    as _i491;
import '../../features/profile/data/repositories/profile_repository.dart'
    as _i361;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/register_vehicle/data/data_sources/register_vehicle_remote_data_source.dart'
    as _i1009;
import '../../features/register_vehicle/data/data_sources/register_vehicle_remote_data_source_impl.dart'
    as _i492;
import '../../features/register_vehicle/data/repositories/register_vehicle_repository.dart'
    as _i987;
import '../../features/register_vehicle/presentation/bloc/register_vehicle_bloc.dart'
    as _i118;
import '../../features/sign_in/data/data_sources/remote/sign_in_remote_data_source.dart'
    as _i533;
import '../../features/sign_in/data/data_sources/remote/sign_in_remote_data_source_impl.dart'
    as _i1024;
import '../../features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i307;
import '../../features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i862;
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart' as _i640;
import '../../features/sign_up/data/data_sources/remote/sign_up_remote_data_source.dart'
    as _i964;
import '../../features/sign_up/data/data_sources/remote/sign_up_remote_data_source_impl.dart'
    as _i42;
import '../../features/sign_up/data/repositories/sign_up_repository.dart'
    as _i83;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i148;
import '../../features/splash/data/repositories/splash_repository.dart'
    as _i120;
import '../../features/splash/presentation/bloc/splash_bloc.dart' as _i442;
import '../../features/verification_code/data/data_sources/remote/verification_code_remote_data_source.dart'
    as _i89;
import '../../features/verification_code/data/data_sources/remote/verification_code_remote_data_source_impl.dart'
    as _i673;
import '../../features/verification_code/data/repositories/verification_code_repository.dart'
    as _i61;
import '../../features/verification_code/presentation/bloc/verification_code_bloc.dart'
    as _i59;
import '../data_source/remote/base_remote_data_source.dart' as _i755;
import '../data_source/remote/base_remote_data_source_impl.dart' as _i330;
import '../network/network_info.dart' as _i932;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.getSharedPreferences(),
    preResolve: true,
  );
  gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i645.Location>(() => registerModule.location);
  gh.lazySingleton<_i409.GlobalKey<_i409.State<_i409.StatefulWidget>>>(
    () => registerModule.loadingDialogKey,
  );
  gh.lazySingleton<_i183.ImagePicker>(() => registerModule.picker);
  gh.lazySingleton<_i457.FirebaseStorage>(() => registerModule.firebaseStorage);
  gh.lazySingleton<_i212.AppLocalDataSource>(
    () => _i746.AppLocalDataSourceImpl(),
  );
  gh.lazySingleton<_i534.ActivitiesRemoteDataSource>(
    () => _i187.ActivitiesRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i1009.RegisterVehicleRemoteDataSource>(
    () => _i492.RegisterVehicleRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i1003.MainRemoteDataSource>(
    () => _i724.MainRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i533.SignInRemoteDataSource>(
    () => _i1024.SignInRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i1012.ProfileRemoteDataSource>(
    () => _i491.ProfileRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i964.SignUpRemoteDataSource>(
    () => _i42.SignUpRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i89.VerificationCodeRemoteDataSource>(
    () => _i673.VerificationCodeRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i590.MapRemoteDataSource>(
    () => _i935.MapRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i245.AppRepository>(
    () => _i245.AppRepository(gh<_i212.AppLocalDataSource>()),
  );
  gh.lazySingleton<_i755.BaseRemoteDataSource>(
    () => _i330.BaseRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i932.NetworkInfo>(
    () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
  );
  gh.lazySingleton<_i862.SignInRepository>(
    () => _i307.SignInRepositoryImpl(
      gh<_i533.SignInRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i298.MainRepository>(
    () => _i411.MainRepositoryImpl(
      gh<_i1003.MainRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.factory<_i1014.MainBloc>(
    () => _i1014.MainBloc(gh<_i298.MainRepository>(), gh<_i645.Location>()),
  );
  gh.factory<_i640.SignInBloc>(
    () => _i640.SignInBloc(gh<_i862.SignInRepository>()),
  );
  gh.lazySingleton<_i415.ActivitiesRepository>(
    () => _i6.ActivitiesRepositoryImpl(
      gh<_i932.NetworkInfo>(),
      gh<_i534.ActivitiesRemoteDataSource>(),
    ),
  );
  gh.lazySingleton<_i126.MapRepository>(
    () => _i126.MapRepository(
      gh<_i590.MapRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i83.SignUpRepository>(
    () => _i83.SignUpRepository(
      gh<_i964.SignUpRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i61.VerificationCodeRepository>(
    () => _i61.VerificationCodeRepository(
      gh<_i89.VerificationCodeRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i120.SplashRepository>(
    () => _i120.SplashRepository(gh<_i932.NetworkInfo>()),
  );
  gh.factory<_i442.SplashBloc>(
    () => _i442.SplashBloc(gh<_i120.SplashRepository>()),
  );
  gh.lazySingleton<_i571.AppCubit>(
    () => _i571.AppCubit(gh<_i245.AppRepository>()),
  );
  gh.lazySingleton<_i641.AcceptTripUseCase>(
    () => _i641.AcceptTripUseCase(gh<_i298.MainRepository>()),
  );
  gh.lazySingleton<_i987.RegisterVehicleRepository>(
    () => _i987.RegisterVehicleRepository(
      gh<_i1009.RegisterVehicleRemoteDataSource>(),
      gh<_i457.FirebaseStorage>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i361.ProfileRepository>(
    () => _i361.ProfileRepository(
      gh<_i1012.ProfileRemoteDataSource>(),
      gh<_i932.NetworkInfo>(),
    ),
  );
  gh.factory<_i469.ProfileBloc>(
    () => _i469.ProfileBloc(gh<_i361.ProfileRepository>()),
  );
  gh.factory<_i880.ActivitiesBloc>(
    () => _i880.ActivitiesBloc(gh<_i415.ActivitiesRepository>()),
  );
  gh.factory<_i118.RegisterVehicleBloc>(
    () => _i118.RegisterVehicleBloc(
      gh<_i183.ImagePicker>(),
      gh<_i987.RegisterVehicleRepository>(),
    ),
  );
  gh.factory<_i437.MapBloc>(
    () => _i437.MapBloc(
      gh<_i645.Location>(),
      gh<_i641.AcceptTripUseCase>(),
      gh<_i126.MapRepository>(),
    ),
  );
  gh.factory<_i148.SignUpBloc>(
    () => _i148.SignUpBloc(gh<_i83.SignUpRepository>()),
  );
  gh.factory<_i59.VerificationCodeBloc>(
    () => _i59.VerificationCodeBloc(gh<_i61.VerificationCodeRepository>()),
  );
  return getIt;
}

class _$RegisterModule extends _i913.RegisterModule {}
