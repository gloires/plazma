import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DividerWidget extends StatelessWidget {
  final double horizontal;

  const DividerWidget({
    Key? key,
    required this.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal.w),
      child: Divider(
        color: Colors.white.withOpacity(0.3),
      ),
    );
  }
}
