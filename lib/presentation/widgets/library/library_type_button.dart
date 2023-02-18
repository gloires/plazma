import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LibraryTypeButton extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final String title;
  final PhosphorIconData icon;
  final Color shadow;
  final Color titleColor;

  const LibraryTypeButton({
    Key? key,
    required this.firstColor,
    required this.secondColor,
    required this.title,
    required this.icon,
    required this.shadow,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30.sp,
          width: 30.sp,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                firstColor,
                secondColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 5,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontFamily: 'KyivType',
            fontWeight: FontWeight.w500,
            fontSize: 14.0.sp,
          ),
        )
      ],
    );
  }
}
