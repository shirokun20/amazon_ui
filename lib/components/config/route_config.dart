import 'package:amazon_ui/components/di/setup_di.dart';
import 'package:amazon_ui/features/auth_page/auth_page.dart';
import 'package:amazon_ui/features/home_page/home_page.dart';
import 'package:amazon_ui/store/auth_store/auth_store.dart';
import 'package:go_router/go_router.dart';

class RouterPathName {
  static const String defaultPath = '/';
  static const String homePath = '/home';
}

class RouterLabelName {
  static const String defaultName = 'auth';
  static const String homeName = 'home';
}

final AuthStore authStore = sl<AuthStore>();
//
final GoRouter routerConfig = GoRouter(
  initialLocation: RouterPathName.defaultPath,
  routes: [
    GoRoute(
      path: RouterPathName.defaultPath,
      name: RouterLabelName.defaultName,
      builder: (context, state) => AuthPage(),
    ),
    GoRoute(
      path: RouterPathName.homePath,
      name: RouterLabelName.homeName,
      builder: (context, state) => HomePage(),
    ),
  ],
  redirect: (context, state) {
    if (authStore.state.isLoading) {
      return null;
    }

    final isLoggedIn = authStore.state.user.isNotEmpty;
    final isLoggingIn = state.matchedLocation == RouterPathName.defaultPath;

    if (!isLoggedIn) {
      return isLoggingIn
          ? null
          : RouterPathName.defaultPath; // Redirect ke login jika belum login
    }
    return isLoggingIn ? RouterPathName.homePath : null;
  },
);
