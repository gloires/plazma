import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangeAvatarDialog extends StatelessWidget {
  const ChangeAvatarDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: SizedBox(
        height: 25.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                child: Text(
                  "settings.action".tr(),
                  style: TextStyle(
                    fontFamily: 'KyivType',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.background,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(PhosphorIcons.cameraFill, size: 30.sp, color: ThemeColors.background),
                      Text("settings.camera".tr(), style: TextStyle(
                        fontFamily: 'KyivType',
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.background,
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(PhosphorIcons.imageFill, size: 30.sp, color: ThemeColors.background),
                      Text("settings.gallery".tr(), style: TextStyle(
                        fontFamily: 'KyivType',
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.background,
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
