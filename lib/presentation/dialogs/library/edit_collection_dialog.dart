import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:plazma/presentation/widgets/divier_widget.dart';
import 'package:plazma/presentation/widgets/library/collecations_edit_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditCollectionDialog extends StatefulWidget {
  final CollectionsBloc collectionsBloc;
  final CollectionEntity collection;

  const EditCollectionDialog({
    Key? key,
    required this.collection,
    required this.collectionsBloc,
  }) : super(key: key);

  @override
  State<EditCollectionDialog> createState() => _EditCollectionDialogState();
}

class _EditCollectionDialogState extends State<EditCollectionDialog> {
  @override
  void initState() {
    super.initState();
    final state = widget.collectionsBloc.state;
    if (state is CollectionsEditedState) {
      // _setClient(state.client);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: ThemeColors.dialogBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.collection.logoPath.isEmpty
                    ? Container(
                        height: 50,
                        width: 50,
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
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                          image: DecorationImage(
                            image: FileImage(File(widget.collection.logoPath)),
                            fit: BoxFit.fill,
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
                      widget.collection.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'KyivType',
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          PhosphorIcons.lockKeyBold,
                          color: Colors.white.withOpacity(0.5),
                          size: 16.sp,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.collection.count} ${"collection.items".tr()}",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'KyivType',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const DividerWidget(horizontal: 5),
            const SizedBox(
              height: 20,
            ),
            CollectionEditButton(
              icon: PhosphorIcons.pencil,
              title: "collection.edit".tr(),
              onPressed: () {},
            ),
            const SizedBox(
              height: 25,
            ),
            CollectionEditButton(
              icon: PhosphorIcons.shareNetwork,
              title: "collection.share".tr(),
              onPressed: () {},
            ),
            const SizedBox(
              height: 25,
            ),
            CollectionEditButton(
              icon: PhosphorIcons.trash,
              title: "collection.delete".tr(),
              onPressed: () {
                widget.collectionsBloc.add(
                  CollectionsDeleteEvent(
                    id: widget.collection.id,
                  ),
                );
                Navigator.pop(context); //TODO: navigator
                // QR.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
