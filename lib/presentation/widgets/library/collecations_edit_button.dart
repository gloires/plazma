import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CollectionEditButton extends StatelessWidget {
  final PhosphorIconData icon;
  final String title;
  final Function() onPressed;

  const CollectionEditButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20.sp,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'KyivType',
              fontWeight: FontWeight.w500,
              fontSize: 17.0.sp,
            ),
          )
        ],
      ),
    );
  }
}
