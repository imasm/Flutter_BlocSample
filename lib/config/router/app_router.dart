import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    // Home
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    // Cubit Counter
    GoRoute(path: '/cubits', builder: (context, state) => const CubitCounterScreen()),

    // BLoC Counter
    GoRoute(path: '/bloc', builder: (context, state) => const BlocCounterScreen()),
  ],
);
