import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:plazma/core/route/initial_route.dart';
import 'package:plazma/core/theme/colors.dart';

class BottomNavigation extends StatefulWidget {
  final QRouter router;

  const BottomNavigation(this.router, {super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
    widget.router.navigator.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.router,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ThemeColors.background,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(PhosphorIcons.house),
              activeIcon: const Icon(PhosphorIcons.houseFill),
              label: "home_tab.title".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.search_outline),
              activeIcon: const Icon(Ionicons.search),
              label: "search_tab.title".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(PhosphorIcons.books),
              activeIcon: const Icon(PhosphorIcons.booksFill),
              label: "library_tab.title".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(PhosphorIcons.calendarBlank),
              activeIcon: const Icon(PhosphorIcons.calendarBlankFill),
              label: "calendar_tab.title".tr(),
            ),
          ],
          currentIndex: InitialRoutes.tabs
              .indexWhere((element) => element == widget.router.routeName),
          onTap: (v) => QR.toName(InitialRoutes.tabs[v]),
        ),
      );
}
