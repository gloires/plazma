import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CollectionsPrivateAccess extends StatelessWidget {
  final PhosphorIconData icon;
  final String title;
  final String subtitle;
  final int index;
  final int selected;
  final Function() onPressed;

  const CollectionsPrivateAccess({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.index,
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
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'KyivType',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0.sp,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: ThemeColors.dialogHintColor,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0.sp,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox.shrink(),
          ),
          if (index == selected)
            const Icon(
              PhosphorIcons.check,
              color: Colors.white,
            )
        ],
      ),
    );
  }
}
