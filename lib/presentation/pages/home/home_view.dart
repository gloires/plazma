import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:qlevar_router/qlevar_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  String? greeting;
  bool notification = true; //TODO: notification calendar
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    getCurrentTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greeting!,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'KyivType',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0),
                      ),
                      const Text("User A.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'KyivType',
                              fontWeight: FontWeight.w300,
                              fontSize: 18.0))
                    ],
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Stack(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            PhosphorIcons.bellSimple,
                            color: Colors.white,
                            size: 30,
                          )),
                      SizedBox(
                        height: 30,
                        width: 37,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 7,
                            width: 7,
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
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
                tabs: [
                  Tab(text: "home_tab.popular".tr()),
                  Tab(
                    text: "home_tab.latest".tr(),
                  ),
                  Tab(
                    text: "home_tab.coming_soon".tr(),
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 200, //TODO
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.grey,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("home_tab.currently_watching".tr(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'KyivType',
                      fontWeight: FontWeight.w500,
                      fontSize: 17.0)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                color: Colors.grey,
                height: 80,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("home_tab.my_library".tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0)),
                  GestureDetector(
                    onTap: () {
                      QR.to('/dashboard/library');
                    },
                    child: Text("home_tab.see_more".tr(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontFamily: 'KyivType',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
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
            )
          ],
        ),
      ),
    );
  }

  void getCurrentTime() {
    DateTime now = DateTime.now();
    if (now.hour >= 24 && now.hour < 12) {
      greeting = "greetings.morning".tr(); //TODO: text
    } else if (now.hour >= 12 && now.hour < 16) {
      greeting = "greetings.afternoon".tr();
    } else if (now.hour >= 16 && now.hour < 24) {
      greeting = "greetings.evening".tr();
    }
  }
}
