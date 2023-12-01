import 'package:foody/features/onBoarding/presentation/views/onBoarding_view.dart';
import 'package:foody/features/signIn/presentation/views/signIn_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const onBoardingRoute = '/onBoarding';
  static const signInRoute = '/SignIn';

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
    ],
  );
}
