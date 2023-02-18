import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LibraryCollectionsCustomItem extends StatelessWidget {
  final double size;
  final CollectionEntity collection;

  const LibraryCollectionsCustomItem({
    Key? key,
    required this.size,
    required this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          collection.logoPath.isEmpty
              ? Container(
                  height: size,
                  width: size,
                  decoration: const BoxDecoration(
                    color: ThemeColors.collectionButton,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Icon(
                    PhosphorIcons.plus,
                    color: Colors.white,
                    size: 23.sp,
                  ),
                )
              : Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: FileImage(File(collection.logoPath)),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          const SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0.sp,
                  ),
                ),
                Text(
                  "${collection.count} ${"add_collection.items".tr()}",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontFamily: 'KyivType',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0.sp,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Icon( //TODO: click dots and change icon to more proper one
            PhosphorIcons.dotsThreeVerticalBold,
            color: Colors.white,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
