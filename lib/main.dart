import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/common/cubits/auth_cubit/auth_cubit.dart';
import 'package:foody/core/theme/theme_cubit/theme_cubit.dart';
import 'package:foody/core/utils/app_router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // dark text for status bar
      statusBarColor: Colors.transparent));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
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
