import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WatchingPart extends StatelessWidget {
  const WatchingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "home_tab.currently_watching".tr(),
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'KyivType',
                fontWeight: FontWeight.w500,
                fontSize: 17.0.sp),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            color: Colors.grey,
            height: 80,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
