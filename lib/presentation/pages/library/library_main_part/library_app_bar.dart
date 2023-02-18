import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LibraryAppBar extends StatelessWidget {
  const LibraryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "library_tab.my_library".tr(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'KyivType',
                fontWeight: FontWeight.w600,
                fontSize: 20.0.sp,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                PhosphorIcons.clockClockwise,
                color: Colors.white,
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
