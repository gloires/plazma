import 'package:flutter/material.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_app_bar.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_app_version.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_buttons_list.dart';
import 'package:plazma/presentation/pages/home/user_screen/user_information_part.dart';
import 'package:plazma/presentation/widgets/divier_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserScreenView extends StatelessWidget {
  const UserScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
              child: SafeArea(
                child: Column(
                  children: const [
                    UserAppBar(),
                    UserInformationPart(),
                    DividerWidget(horizontal: 5),
                    UserButtonsList(),
                    Expanded(child: SizedBox.shrink()),
                    UserAppVersion(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
