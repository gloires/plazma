import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../core/route/initial_route.dart';

class BottomNavigation extends StatefulWidget {
  final QRouter router;
  BottomNavigation(this.router);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
    widget.router.navigator.addListener(() {
      if (mounted) {
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: widget.router,
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.house),
          activeIcon: Icon(PhosphorIcons.houseFill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.search_outline),
          activeIcon: Icon(Ionicons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.books),
          activeIcon: Icon(PhosphorIcons.booksFill),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(PhosphorIcons.calendarBlank),
          activeIcon: Icon(PhosphorIcons.calendarBlankFill),
          label: 'Calendar',
        ),
      ],
      currentIndex: InitialRoutes.tabs
          .indexWhere((element) => element == widget.router.routeName),
      onTap: (v) => QR.toName(InitialRoutes.tabs[v]),
    ),
  );
}