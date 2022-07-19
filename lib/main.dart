import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:plazma/core/theme/themes.dart';
import 'package:plazma/core/route/route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru'), Locale('uk')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          return const PlazmaApp();
        })),
  );
}

class PlazmaApp extends StatelessWidget {
  const PlazmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes();
    appRoutes.setup();
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(
        appRoutes.routes, initPath: '/dashboard'
      ),
      theme: darkTheme,
    );
  }
}
