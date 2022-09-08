import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:plazma/domain/entities/movie_entity.dart';
import 'package:plazma/presentation/bloc/movie/movie_bloc.dart';
import 'package:plazma/presentation/pages/home/popular_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentTime();
    return Scaffold(
      key: _key,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
                child: GestureDetector(
                  onTap: () {
                    QR.to('/user');
                    QR.currentPath;
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
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  padding: EdgeInsets.only(top: 1.h, left: 1.w),
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontFamily: 'KyivType',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0.sp),
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
              SizedBox(
                height: 200, //TODO
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BlocBuilder<MovieBloc, MovieState>(
                      builder: (BuildContext context, state) {
                        if(state is MovieLoadedState) {
                          MovieEntity movieCard = state.movie;
                          return PopularCard(movie: movieCard);
                        }
                        return  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 135, vertical: 60),
                          child: LoadingIndicator(
                            colors: [ThemeColors.blueSelected],
                            indicatorType: Indicator.lineScale,
                            strokeWidth: 1,
                            pause: false,
                            // pathBackgroundColor: Colors.black45,
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 135, vertical: 60),
                      child: LoadingIndicator(
                        colors: [ThemeColors.blueSelected],
                        indicatorType: Indicator.lineScale,
                        strokeWidth: 1,
                        pause: false,
                        // pathBackgroundColor: Colors.black45,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 135, vertical: 60),
                      child: LoadingIndicator(
                        colors: [ThemeColors.blueSelected],
                        indicatorType: Indicator.lineScale,
                        strokeWidth: 1,
                        pause: false,
                        // pathBackgroundColor: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("home_tab.currently_watching".tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'KyivType',
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0.sp)),
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
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'KyivType',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0.sp)),
                    GestureDetector(
                      onTap: () {
                        QR.to('/dashboard/library');
                      },
                      child: Text("home_tab.see_more".tr(),
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontFamily: 'KyivType',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0.sp)),
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
      ),
    );
  }

  void getCurrentTime() {
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

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
