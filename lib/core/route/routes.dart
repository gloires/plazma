import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/core/route/material_dialog_route.dart';
import 'package:plazma/core/route/transitions/transitions.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:plazma/presentation/bloc/user/user_bloc.dart';
import 'package:plazma/presentation/dialogs/library/add_collection_dialog.dart';
import 'package:plazma/presentation/dialogs/library/edit_collection_dialog.dart';
import 'package:plazma/presentation/pages/bottom_navigation.dart';
import 'package:plazma/presentation/pages/calendar/calendar_view.dart';
import 'package:plazma/presentation/pages/home/home_view.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_screen_view.dart';
import 'package:plazma/presentation/pages/library/library_main_part/library_collection_view.dart';
import 'package:plazma/presentation/pages/library/library_view.dart';
import 'package:plazma/presentation/pages/search/search_view.dart';
import 'package:routemaster/routemaster.dart';

import '../../locator_service.dart';

final routes = RoutemasterDelegate(
  routesBuilder: (BuildContext context) {
    final userBloc = sl<UserBloc>();
    final collectionBloc = sl<CollectionsBloc>();

    return RouteMap(
      routes: {
        '/': (route) => const TabPage(
              child: BottomNavigation(),
              paths: ['/home', '/search', '/library', '/calendar'],
            ),
        '/home': (route) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: userBloc
                      ..add(
                        UserGetEvent(),
                      ),
                  ),
                ],
                child: const HomeView(),
              ),
            ),
        '/home/user': (route) => TransitionPage(
              pushTransition: const BottomToTopTransition(),
              popTransition: const BottomToTopTransition(),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: userBloc
                      ..add(
                        UserGetEvent(),
                      ),
                  ),
                ],
                child: const UserScreenView(),
              ),
            ),
        '/search': (route) => const MaterialPage(
              child: SearchView(),
            ),
        '/library': (route) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: collectionBloc
                      ..add(
                        CollectionsGetListEvent(),
                      ),
                  ),
                ],
                child: const LibraryView(),
              ),
            ),
        '/library/collection/edit': (route) => MaterialDialog(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: collectionBloc),
                ],
                child: const AddCollectionDialog(),
              ),
            ),
        '/library/collection/:id': (route) => MaterialDialog(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: collectionBloc
                      ..add(
                        CollectionsGetEvent(
                          id: int.parse(route.pathParameters['id'] ?? ""),
                        ),
                      ),
                  ),
                ],
                child: const LibraryCollectionView(),
              ),
            ),
        '/calendar': (route) => const MaterialPage(
              child: CalendarView(),
            ),
      },
    );
  },
);
