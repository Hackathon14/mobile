import 'package:go_router/go_router.dart';
import 'package:smart_eco_mobile/auth/presentation/login_view.dart';
import 'package:smart_eco_mobile/auth/presentation/register/register_view.dart';

GoRouter createRouter() => GoRouter(
      initialLocation: '/login',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/login',
          name: 'LoginView',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          path: '/register',
          name: 'RegisterView',
          builder: (context, state) => RegisterView(),
        ),
      ],
    );
