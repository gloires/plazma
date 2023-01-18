import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/presentation/bloc/user/user_bloc.dart';
import 'package:plazma/presentation/widgets/user/user_name_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserInformationPart extends StatefulWidget {
  const UserInformationPart({Key? key}) : super(key: key);

  @override
  State<UserInformationPart> createState() => _UserInformationPartState();
}

class _UserInformationPartState extends State<UserInformationPart> {
  String _name = "User";
  String _imagePath = 'assets/images/avatar.png';

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Column(
      children: [
        BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) {
            return (current is UserLoadedState ||
                current is UserEmptyState);
          },
          builder: (context, state) {
            if (state is UserLoadedState) {
              _name = state.user.name;
              _imagePath = state.user.imagePath;
            }
            return Column(
              children: [
                GestureDetector(
                  onTap: null,
                  child: Container(
                    height: 40.sp,
                    width: 40.sp,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_imagePath),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                UserName(
                  initValue: _name,
                  userBloc: userBloc,
                ),
              ],
            );
          },
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
                      child: Text(
                        "1234/1235",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontFamily: 'Kyiv*Type',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        "567/568",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontFamily: 'Kyiv*Type',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        "23/25",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontFamily: 'Kyiv*Type',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        "settings.episodes".tr().toLowerCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 17.sp,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        "settings.hours".tr().toLowerCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 17.sp,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(
                      child: Text(
                        "settings.days".tr().toLowerCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 17.sp,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
