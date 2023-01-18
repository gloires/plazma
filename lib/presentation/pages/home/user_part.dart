import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserPart extends StatefulWidget {
  const UserPart({Key? key}) : super(key: key);

  @override
  State<UserPart> createState() => _UserPartState();
}

class _UserPartState extends State<UserPart> {
  String? greeting;
  bool notification = true; //TODO: notification calendar

  @override
  void initState() {
    _getCurrentTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
      child: GestureDetector(
        onTap: () {
          QR.to('/user');
        },
        child: Row(
          children: [
            Container(
              height: 30.sp,
              width: 30.sp,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting!,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontFamily: 'KyivType',
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0.sp),
                ),
                Text("User A.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'KyivType',
                        fontWeight: FontWeight.w300,
                        fontSize: 17.5.sp))
              ],
            ),
            const Expanded(child: SizedBox.shrink()),
            Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      PhosphorIcons.bellSimple,
                      color: Colors.white,
                      size: 23.sp,
                    )),
                SizedBox(
                  height: 23.sp,
                  width: 25.sp,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 11.sp,
                      width: 11.sp,
                      decoration: BoxDecoration(
                          color: notification
                              ? ThemeColors.blueSelected
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _getCurrentTime() {
    DateTime now = DateTime.now();
    setState(() {
      if (now.hour >= 00 && now.hour < 12) {
        greeting = "greetings.morning".tr(); //TODO: text
      } else if (now.hour >= 12 && now.hour < 16) {
        greeting = "greetings.afternoon".tr();
      } else if (now.hour >= 16 && now.hour < 24) {
        greeting = "greetings.evening".tr();
      }
    });
  }
}
