import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/main/presentation/cubit/main_cubit.dart';
import '../../features/main/presentation/pages/main_page.dart';
import '../../features/map/presentation/bloc/map_bloc.dart';
import '../../features/map/presentation/pages/map_page.dart';
import '../../features/register_vehicle/presentation/bloc/register_vehicle_bloc.dart';
import '../../features/register_vehicle/presentation/pages/register_vehicle_page.dart';
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart';
import '../../features/sign_in/presentation/pages/sign_in_page.dart';
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart';
import '../../features/sign_up/presentation/pages/sign_up_page.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/verification_code/presentation/bloc/verification_code_bloc.dart';
import '../../features/verification_code/presentation/pages/verification_code_page.dart';
import '../di/di.dart';
import '../entities/trip.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SplashBloc>(
            create: (context) => getIt<SplashBloc>()..checkUserAuthentication(),
            child: const SplashPage(),
          ),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MainCubit>(
            create: (_) => getIt<MainCubit>(),
            child: const MainPage(),
          ),
        );
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignInBloc>(
            create: (context) => getIt<SignInBloc>(),
            child: const SignInPage(),
          ),
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpBloc>(
            create: (context) => getIt<SignUpBloc>(),
            child: const SignUpPage(),
          ),
        );
      case Routes.verificationCodePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<VerificationCodeBloc>(
            create: (context) =>
                getIt<VerificationCodeBloc>()..generateVerificationCode(),
            child: const VerificationCodePage(),
          ),
        );
      case Routes.registerVehiclePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterVehicleBloc>(
            create: (context) => getIt<RegisterVehicleBloc>(),
            child: const RegisterVehiclePage(),
          ),
        );
      case Routes.mapPage:
        final Trip trip = arguments as Trip;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MapBloc>(
            create: (context) => getIt<MapBloc>()
              ..getAddressDetails(trip)
              ..getCurrentLocation(),
            child: const MapPage(),
          ),
        );
      default:
        return null;
    }
  }
}
