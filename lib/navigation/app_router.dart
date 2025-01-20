import 'package:ball_park/screens/landing/landing_second_screen.dart';
import 'package:ball_park/screens/landing/landing_third_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/dashboard_screen.dart';
import '../screens/landing/landing_first_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/landing_one',
    routes: [
      GoRoute(
        path: '/landing_one',
        builder: (context, state) => const LandingFirstScreen(),
      ),
      GoRoute(
        path: '/landing_two',
        builder: (context, state) => const LandingSecondScreen(),
      ),
      GoRoute(
        path: '/landing_three',
        builder: (context, state) => const LandingThirdScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => const DashboardScreen())
    ],
  );
}
