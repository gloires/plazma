import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:plazma/core/theme/themes.dart';
import 'package:plazma/core/route/route.dart';

void main() {
  runApp(const PlazmaApp());
}

class PlazmaApp extends StatelessWidget {
  const PlazmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes();
    appRoutes.setup();
    return MaterialApp.router(
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(
        appRoutes.routes,
      ),
      theme: darkTheme,
    );
  }
}