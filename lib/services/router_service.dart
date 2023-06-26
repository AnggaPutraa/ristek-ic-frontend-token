import 'package:go_router/go_router.dart';

import '../features/authentication/signin/presentation/page/sign_in_page.dart';
import '../features/authentication/signup/presentation/page/sign_up_page.dart';
import '../features/main/presentation/pages/main_page.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/onboarding/presentation/pages/splash_screen.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: '/auth/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/auth/signin',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
  ],
);