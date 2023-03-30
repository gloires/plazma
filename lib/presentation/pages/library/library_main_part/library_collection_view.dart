import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routemaster/routemaster.dart';

class LibraryCollectionView extends StatelessWidget {
  const LibraryCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Routemaster.of(context).pop(),
          icon: Icon(
            //TODO: click dots and change icon to more proper one
            PhosphorIcons.caretLeft,
            color: Colors.white,
            size: 22.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO
            },
            icon: Icon(
              PhosphorIcons.dotsThreeOutlineVerticalFill,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        child: Column(
          children: [
            BlocBuilder<CollectionsBloc, CollectionsState>(
              builder: (BuildContext context, state) {
                if (state is CollectionsLoadedState) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      state.collection.logoPath.isEmpty
                          ? Container(
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                color: ThemeColors.collectionButton,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              child: Icon(
                                PhosphorIcons.plus,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            )
                          : Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                image: DecorationImage(
                                  image: FileImage(
                                      File(state.collection.logoPath)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.collection.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'KyivType',
                              fontWeight: FontWeight.w500,
                              fontSize: 19.0.sp,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              state.collection.private == 0
                                  ? Icon(
                                      PhosphorIcons.lockKeyBold,
                                      color: Colors.white.withOpacity(0.5),
                                      size: 16.sp,
                                    )
                                  : Icon(
                                      PhosphorIcons.linkBold,
                                      color: Colors.white.withOpacity(0.5),
                                      size: 16.sp,
                                    ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${state.collection.count} ${"collection.items".tr()}",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'KyivType',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              state.collection.description,
                              overflow: TextOverflow.ellipsis,
                              //TODO: long user name
                              maxLines: 2,
                              style: TextStyle(
                                color: ThemeColors.dialogHintColor,
                                fontFamily: 'KyivType',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return Container(); //TODO:
              },
            )
          ],
        ),
      ),
    );
  }
}
