import 'package:plazma/presentation/pages/bottom_navigation.dart';
import 'package:plazma/presentation/pages/calendar/calendar_view.dart';
import 'package:plazma/presentation/pages/library/library_view.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/search/search_view.dart';

class InitialRoutes {
  static const String bottomNavBar = 'bottomNavBarRoute';
  static const tabs = [
    'dashboard_home',
    'dashboard_search',
    'dashboard_library',
    'dashboard_calendar'
  ];

  final route = QRoute.withChild(
      path: '/dashboard',
      name: bottomNavBar,
      initRoute: '/home',
      builderChild: (router) => BottomNavigation(router),
      children: [
        QRoute(
          path: '/home',
          name: tabs[0],
          pageType: const QFadePage(),
          builder: () => const HomeView(),
        ),
        QRoute(
          path: '/search',
          name: tabs[1],
          pageType: const QFadePage(),
          builder: () => const SearchView(),
        ),
        QRoute(
          path: '/library',
          name: tabs[2],
          pageType: const QFadePage(),
          builder: () => const LibraryView(),
        ),
        QRoute(
          path: '/calendar',
          name: tabs[3],
          pageType: const QFadePage(),
          builder: () => const CalendarView(),
        ),
      ]);
}
