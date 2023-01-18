import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyLibraryPart extends StatelessWidget {
  const MyLibraryPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("home_tab.my_library".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'KyivType',
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0.sp)),
              GestureDetector(
                onTap: () {
                  QR.to('/dashboard/library');
                },
                child: Text(
                  "home_tab.see_more".tr(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontFamily: 'KyivType',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0.sp),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            color: Colors.grey,
            height: 200,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
