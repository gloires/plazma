import 'package:flutter/material.dart';
import 'package:plazma/core/theme/colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: ThemeColors.background,
  drawerTheme: const DrawerThemeData(
    backgroundColor: ThemeColors.background,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 10,
    selectedLabelStyle: const TextStyle(
        color: ThemeColors.blueSelected,
        fontFamily: 'KyivType',
        fontWeight: FontWeight.w500,
        fontSize: 11.0),
    unselectedLabelStyle: const TextStyle(
        color: ThemeColors.blueSelected,
        fontFamily: 'KyivType',
        fontWeight: FontWeight.w500,
        fontSize: 11.0),
    selectedItemColor: ThemeColors.blueSelected,
    unselectedItemColor: Colors.white.withOpacity(0.5),
    showUnselectedLabels: true,
  ),
);
