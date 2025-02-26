import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'app/presentation/bloc/app_cubit.dart';
import 'app/presentation/deliver_driver_app.dart';
import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(
    BlocProvider<AppCubit>(
      create: (_) => getIt<AppCubit>()..getAppLanguage(),
      child: DeliverDriverApp(
        appRouter: AppRouter(),
      ),
    ),
  );

  // await dotenv.load(fileName: Assets.deliverDriverApp);
  // final String? sentryDsn = dotenv.env['SENTRY_DSN'];
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = sentryDsn;
  //     options.tracesSampleRate = 1.0;
  //     options.profilesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(
  //     BlocProvider<AppCubit>(
  //       create: (_) => getIt<AppCubit>()..getAppLanguage(),
  //       child: DeliverDriverApp(
  //         appRouter: AppRouter(),
  //       ),
  //     ),
  //   ),
  // );
}
