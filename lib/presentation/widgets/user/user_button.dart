import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserButton extends StatelessWidget {
  final Color primaryShadow;
  final Color secondaryShadow;
  final Color primaryLinear;
  final Color secondaryLinear;
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  final Widget? trailing;

  const UserButton({
    Key? key,
    required this.primaryShadow,
    required this.secondaryShadow,
    required this.primaryLinear,
    required this.secondaryLinear,
    required this.icon,
    required this.title,
    this.onPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: primaryShadow,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
            BoxShadow(
              color: secondaryShadow,
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryLinear,
              secondaryLinear,
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title.tr(),
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'KyivType',
            fontWeight: FontWeight.w400,
            fontSize: 16.5.sp),
      ),
      onTap: () => onPressed,
    );
  }
}
