import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/cubits/auth_cubit/auth_cubit.dart';
import 'package:foody/core/theme/theme_cubit/theme_cubit.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:foody/features/home/data/repo/home_repo_implementation.dart';
import 'package:foody/features/home/data/services.dart/api_service.dart';
import 'package:foody/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:foody/simple_bloc_observer.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/chat/presentation/managers/chat_cubit/chat_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // dark text for status bar
      statusBarColor: Colors.transparent));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  await Hive.initFlutter();
  await Hive.openBox(kEmail);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => ChatCubit(),
      ),
      BlocProvider(
        create: (context) => ProductsCubit(
          HomeRepoImplementation(
            ApiService(
              Dio(),
            ),
          ),
        )..getAllHomeProducts(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      duration: const Duration(milliseconds: 750),
      initTheme: BlocProvider.of<ThemeCubit>(context).themeData,
      builder: (p0, theme) => MaterialApp.router(
        theme: BlocProvider.of<ThemeCubit>(context).themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
