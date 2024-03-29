import "package:flutter_bloc/flutter_bloc.dart";

import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:go_router/go_router.dart";

import "package:flutter/material.dart";
import "package:inno_hack/Router/auth_listenable.dart";
import "package:inno_hack/core/constants.dart";
import "package:inno_hack/models/catalog.dart";
import "package:inno_hack/provider/user_provider.dart";
import "package:inno_hack/root_scaffold.dart";
import "package:inno_hack/screens/LeaderBoardScreen.dart";

import "package:inno_hack/screens/add_catalog.dart";
import "package:inno_hack/screens/edit_catalog.dart";
import "package:inno_hack/screens/home_screen.dart";
import "package:inno_hack/screens/leaderboard_categories.dart";

import "package:inno_hack/screens/login_screen.dart";
import "package:inno_hack/screens/profile_screen.dart";
import "package:inno_hack/screens/user_details_screen.dart";
import "package:inno_hack/screens/products_screen.dart";
import "package:inno_hack/screens/second_screen.dart";

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAttendanceKey =
    GlobalKey<NavigatorState>(debugLabel: 'mainnavigation');

final _shellNavigatorRoomsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellRooms');

final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');
AuthListen authListen = AuthListen();

final GoRouter router = GoRouter(
  initialLocation: '/',
  refreshListenable: authListen,
  redirect: (context, state) {
    print("redirect state.fullpath = ${state.fullPath}");
    String? redirectTo;

    if (authListen.status == AuthenticationStatus.waiting) {
      FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
      return null;
    }
    print(authListen.status);
    if (state.fullPath == '/') {
      if (authListen.status == AuthenticationStatus.authenticated) {
        context.read<UserProvider>().email = authListen.userx!.email;
        context.read<UserProvider>().name = authListen.userx!.name;
        context.read<UserProvider>().uid = authListen.userx!.fireabseId;

        redirectTo = '/home_page';
      } else if (authListen.status == AuthenticationStatus.unauthenticated) {
        redirectTo = '/';
      } else if (authListen.status == AuthenticationStatus.needToFinishSignup) {
        redirectTo = '/other_details';
      }
    }
    print("redirect To => $redirectTo");
    FlutterNativeSplash.remove();
    return redirectTo;
  },
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return RootScaffold(child: child);
        },
        branches: [
          StatefulShellBranch(
              navigatorKey: _shellNavigatorAttendanceKey,
              routes: [
                GoRoute(
                  path: '/home_page',
                  pageBuilder: (context, state) => const MaterialPage(
                      child: HomeScreen(), maintainState: true),
                ),
              ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorRoomsKey, routes: [
            GoRoute(
              path: '/leaderboard_categories',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: LeaderBoardCategories()),
            ),
            GoRoute(
                path: '/leaderboard_screen',
                name: 'leaderboard',
                pageBuilder: (context, state) {
                  Categories category = state.extra as Categories;
                  return MaterialPage(
                      child: LeaderBoardScreen(
                    category: category,
                  ));
                })
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorProfileKey, routes: [
            GoRoute(
              path: '/profile_screen',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: ProfileScreen()),
            ),
          ]),
        ]),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return const RootScaffold(child: SecondScreen());
          },
        ),
      ],
    ),
    GoRoute(
      path: '/add_catalog',
      pageBuilder: (context, state) => const MaterialPage(child: AddCatalog()),
    ),
    GoRoute(
        path: '/edit_catalog',
        name: 'edit_catalog',
        pageBuilder: (context, state) {
          final Catalog catalog = state.extra as Catalog;
          return MaterialPage(
              child: EditCatalog(
            catalog: catalog,
          ));
        }),
    GoRoute(
      path: '/other_details',
      pageBuilder: (context, state) =>
          const MaterialPage(child: OthersDetailScreen()),
    ),
  ],
);
