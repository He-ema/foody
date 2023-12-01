import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/theme/theme_cubit/theme_cubit.dart';
import 'package:foody/core/utils/app_router.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
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
