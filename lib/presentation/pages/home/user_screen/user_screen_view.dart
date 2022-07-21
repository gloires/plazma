import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/presentation/dialogs/change_avatar_dialog.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widgets/language_dropdown.dart';
import '../../../widgets/user_name_widget.dart';

class UserScreenView extends StatelessWidget {
  const UserScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
      child: Column(
        children: [
          SafeArea(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("settings.title".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'KyivType',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0.sp)),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {
                                  QR.back();
                                },
                                icon: Icon(
                                  PhosphorIcons.xBold,
                                  color: Colors.white,
                                  size: 22.sp,
                                )))
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => const ChangeAvatarDialog()),
                  child: Container(
                    height: 40.sp,
                    width: 40.sp,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const UserName(
                  initValue: 'User A.',
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Table(
              border: null,
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                            child: Text("1234/1235",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontFamily: 'Kyiv*Type',
                                  fontWeight: FontWeight.w500,
                                )))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                            child: Text("567/568",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontFamily: 'Kyiv*Type',
                                  fontWeight: FontWeight.w500,
                                )))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                            child: Text("23/25",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontFamily: 'Kyiv*Type',
                                  fontWeight: FontWeight.w500,
                                )))),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                            child: Text("settings.episodes".tr().toLowerCase(),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 17.sp,
                                  fontFamily: 'KyivType',
                                  fontWeight: FontWeight.w300,
                                )))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                            child: Text("settings.hours".tr().toLowerCase(),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 17.sp,
                                  fontFamily: 'KyivType',
                                  fontWeight: FontWeight.w300,
                                )))),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                            child: Text("settings.days".tr().toLowerCase(),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 17.sp,
                                  fontFamily: 'KyivType',
                                  fontWeight: FontWeight.w300,
                                )))),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Divider(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          ListTile(
            leading: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(194, 44, 61, 0.57),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, -1),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(34, 36, 51, 1),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(224, 93, 108, 1),
                      Color.fromRGBO(236, 103, 46, 1)
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const Icon(
                  PhosphorIcons.bookmarkSimpleLight,
                  color: Colors.white,
                )),
            title: Text("settings.saved".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.5.sp)),
            onTap: () => null,
          ),
          ListTile(
            trailing: const LanguageDropdown(),
            leading: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(65, 44, 194, 0.57),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(34, 36, 51, 1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(2, 149, 219, 1),
                    Color.fromRGBO(187, 46, 236, 1)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Icon(
                PhosphorIcons.globeLight,
                color: Colors.white,
              ),
            ),
            title: Text("settings.language".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.5.sp)),
            onTap: () => null,
          ),
          ListTile(
            leading: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(44, 194, 140, 0.57),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(34, 36, 51, 1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(137, 219, 2, 1),
                    Color.fromRGBO(46, 202, 236, 1)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Icon(
                PhosphorIcons.lockSimpleLight,
                color: Colors.white,
              ),
            ),
            title: Text("settings.privacy".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.5.sp)),
            onTap: () => null,
          ),
          ListTile(
            leading: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(44, 59, 194, 0.57),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(34, 36, 51, 1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(2, 50, 219, 1),
                    Color.fromRGBO(46, 168, 236, 1)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Icon(
                PhosphorIcons.chatsTeardropLight,
                color: Colors.white,
              ),
            ),
            title: Text("settings.help".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.5.sp)),
            onTap: () => null,
          ),
          ListTile(
            leading: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(194, 116, 44, 0.57),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(34, 36, 51, 1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(219, 197, 2, 1),
                    Color.fromRGBO(236, 80, 46, 1)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Icon(
                PhosphorIcons.infoLight,
                color: Colors.white,
              ),
            ),
            title: Text("settings.about".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.5.sp)),
            onTap: () => null,
          ),
          const Expanded(child: SizedBox.shrink()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('App Version v1.1',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.2),
                      fontFamily: 'KyivType',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0)),
            ],
          ),
        ],
      ),
    ));
  }
}
