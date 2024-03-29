import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routemaster/routemaster.dart';

class LibraryCollectionsCustomItem extends StatelessWidget {
  final CollectionsBloc collectionsBloc;
  final double size;
  final CollectionEntity collection;

  const LibraryCollectionsCustomItem({
    Key? key,
    required this.size,
    required this.collection,
    required this.collectionsBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: () =>
            Routemaster.of(context).push('/collection/${collection.id}'),
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
                        fit: BoxFit.cover,
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
                    "${collection.count} ${"collection.items".tr()}",
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
            IconButton(
              onPressed: () => Routemaster.of(context)
                  .push("/collection_info/${collection.id}"),
              icon: Icon(
                PhosphorIcons.dotsThreeOutlineVerticalFill,
                color: Colors.white,
                size: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
