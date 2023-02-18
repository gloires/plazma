import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/presentation/widgets/library/library_type_button.dart';

class LibraryGenreList extends StatelessWidget {
  const LibraryGenreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LibraryTypeButton(
            firstColor: ThemeColors.moviesBackgroundFirst,
            secondColor: ThemeColors.moviesBackgroundSecond,
            title: "library_tab.movies".tr(),
            icon: PhosphorIcons.filmSlate,
            shadow: ThemeColors.moviesBackgroundShadow,
            titleColor: ThemeColors.moviesTitle,
          ),
          LibraryTypeButton(
            firstColor: ThemeColors.showsBackgroundFirst,
            secondColor: ThemeColors.showsBackgroundSecond,
            title: "library_tab.tv_shows".tr(),
            icon: PhosphorIcons.filmStrip,
            shadow: ThemeColors.showsBackgroundShadow,
            titleColor: ThemeColors.showsTitle,
          ),
          LibraryTypeButton(
            firstColor: ThemeColors.animeBackgroundFirst,
            secondColor: ThemeColors.animeBackgroundSecond,
            title: "library_tab.anime".tr(),
            icon: PhosphorIcons.television,
            shadow: ThemeColors.animeBackgroundShadow,
            titleColor: ThemeColors.animeTitle,
          ),
          LibraryTypeButton(
            firstColor: ThemeColors.cartoonsBackgroundFirst,
            secondColor: ThemeColors.cartoonsBackgroundSecond,
            title: "library_tab.cartoons".tr(),
            icon: PhosphorIcons.finnTheHuman,
            shadow: ThemeColors.cartoonsBackgroundShadow,
            titleColor: ThemeColors.cartoonsTitle,
          ),
        ],
      ),
    );
  }
}
