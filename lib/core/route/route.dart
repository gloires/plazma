import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_screen_view.dart';
import 'package:qlevar_router/qlevar_router.dart';
import '../../presentation/pages/splashscreen/splash_view.dart';
import 'initial_route.dart';

class AppRoutes {
  static const String root = 'root';

  void setup() {
    QR.settings.enableDebugLog = true;
    QR.observer.onNavigate.add((path, route) async {
      print('Observer:: navigating to $path');
    });

    QR.observer.onPop.add((path, route) async {
      print('Observer:: popping out from $path');
    });
    QR.settings.pagesType = const QFadePage();
  }

  final routes = <QRoute>[
    /* QRoute(
      path: '/',
      name: root,
      middleware: [
        QMiddlewareBuilder(
          redirectGuardFunc: (_) async {
            return '/dashboard'; //TODO: splash screen
          },
        )
      ],
      builder: () => const SplashView(),
    ), */
    InitialRoutes().route,
    QRoute(
        path: '/user',
        pageType: const QSlidePage(
          offset: Offset(0, 1),
          transitionDurationMilliseconds: 300,
          reverseTransitionDurationMilliseconds: 200
        ),
        builder: () => const UserScreenView())
  ];
}
