import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart';
import '../../features/sign_in/presentation/pages/sign_in_page.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../di/di.dart';
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
      // case Routes.mainPage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<MainBloc>(
      //       create: (_) => getIt<MainBloc>()..getCurrentTrip(),
      //       child: const MainPage(),
      //     ),
      //   );
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignInBloc>(
            create: (context) => getIt<SignInBloc>(),
            child: const SignInPage(),
          ),
        );
      // case Routes.signUpPage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<SignUpBloc>(
      //       create: (context) => getIt<SignUpBloc>(),
      //       child: const SignUpPage(),
      //     ),
      //   );
      // case Routes.verificationCodePage:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<VerificationCodeBloc>(
      //       create: (context) =>
      //           getIt<VerificationCodeBloc>()..generateVerificationCode(),
      //       child: const VerificationCodePage(),
      //     ),
      //   );
      // case Routes.mapPage:
      //   final Trip? trip = arguments as Trip?;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<MapBloc>(
      //       create: (context) {
      //         final MapBloc mapBloc = getIt<MapBloc>();
      //         mapBloc.getCurrentLocation();
      //         if (trip != null) {
      //           mapBloc.setCurrentTrip(trip);
      //         }
      //         return mapBloc;
      //       },
      //       child: const MapPage(),
      //     ),
      //   );
      // case Routes.onBoardingPage:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingPage(),
      //   );
      default:
        return null;
    }
  }
}
