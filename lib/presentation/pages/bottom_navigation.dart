import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routemaster/routemaster.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return Scaffold(
      bottomNavigationBar: TabBar(
        controller: tabPage.controller,
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.white,
        labelColor: ThemeColors.blueSelected,
        labelStyle: TextStyle(
          fontFamily: 'KyivType',
          fontWeight: FontWeight.w500,
          fontSize: 14.0.sp,
        ),
        tabs: [
          Tab(
            text: "home_tab.title".tr(),
            icon: tabPage.index != 0
                ? const Icon(PhosphorIcons.house)
                : const Icon(PhosphorIcons.houseFill),
          ),
          Tab(
            text: "search_tab.title".tr(),
            icon: tabPage.index != 1
                ? const Icon(Ionicons.search_outline)
                : const Icon(Ionicons.search),
          ),
          Tab(
            text: "library_tab.title".tr(),
            icon: tabPage.index != 2
                ? const Icon(PhosphorIcons.books)
                : const Icon(PhosphorIcons.booksFill),
          ),
          Tab(
            text: "calendar_tab.title".tr(),
            icon: tabPage.index != 3
                ? const Icon(PhosphorIcons.calendarBlank)
                : const Icon(PhosphorIcons.calendarBlankFill),
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabPage.controller,
        children: [
          for (final stack in tabPage.stacks) PageStackNavigator(stack: stack),
        ],
      ),
    );
  }
}
