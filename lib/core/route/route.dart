import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/presentation/bloc/user/user_bloc.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_screen_view.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:plazma/locator_service.dart';
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
    InitialRoutes().route,
    QRoute(
      path: '/user',
      pageType: const QSlidePage(
        offset: Offset(0, 1),
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 200),
      ),
      builder: () => BlocProvider.value(
        value: sl<UserBloc>()..add(UserGetEvent()),
        child: const UserScreenView(),
      ),
    ),
  ];
}
