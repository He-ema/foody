import 'package:flutter/material.dart';
import 'package:foody/features/OTP/presentation/views/otp_view.dart';
import 'package:foody/features/congratulations/presentation/views/congratulations_view.dart';
import 'package:foody/features/info/presentation/views/info_view.dart';
import 'package:foody/features/logIn/presentation/views/login_view.dart';
import 'package:foody/features/onBoarding/presentation/views/onBoarding_view.dart';
import 'package:foody/features/signIn/presentation/views/signIn_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const onBoardingRoute = '/onBoarding';
  static const signInRoute = '/SignIn';
  static const logInRoute = '/LogIn';
  static const infoRoute = '/InfoView';
  static const otpRoute = '/otp';
  static const congratsRoute = '/congrat';
  static const bottomNavBarRoute = '/bottomNavBarRoute';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingRoute,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: signInRoute,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: logInRoute,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: infoRoute,
        builder: (context, state) => const InfoView(),
      ),
      GoRoute(
        path: otpRoute,
        builder: (context, state) => const OTPView(),
      ),
      GoRoute(
        path: congratsRoute,
        builder: (context, state) => const CongratulationsView(),
      ),
      GoRoute(
        path: bottomNavBarRoute,
        builder: (context, state) => const BottomNavigationBarView(),
      ),
    ],
  );
}
