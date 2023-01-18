import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/movie_entity.dart';
import 'package:plazma/presentation/bloc/movie/movie_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:plazma/presentation/widgets/cards/popular_card.dart';

class PopularPart extends StatefulWidget {
  const PopularPart({Key? key}) : super(key: key);

  @override
  State<PopularPart> createState() => _PopularPartState();
}

class _PopularPartState extends State<PopularPart>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  if (state is MovieLoadedState) {
                    MovieEntity movieCard = state.movie;
                    return PopularCard(movie: movieCard);
                  }
                  return const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 135, vertical: 60),
                    child: LoadingIndicator(
                      colors: [ThemeColors.blueSelected],
                      indicatorType: Indicator.lineScale,
                      strokeWidth: 1,
                      pause: false,
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
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 135, vertical: 60),
                child: LoadingIndicator(
                  colors: [ThemeColors.blueSelected],
                  indicatorType: Indicator.lineScale,
                  strokeWidth: 1,
                  pause: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
