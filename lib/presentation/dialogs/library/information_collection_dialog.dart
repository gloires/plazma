import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:plazma/presentation/widgets/divier_widget.dart';
import 'package:plazma/presentation/widgets/library/collections_edit_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routemaster/routemaster.dart';

class InformationCollectionDialog extends StatefulWidget {
  const InformationCollectionDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<InformationCollectionDialog> createState() =>
      _InformationCollectionDialogState();
}

class _InformationCollectionDialogState
    extends State<InformationCollectionDialog> {
  String _imagePath = "";
  String _title = "";
  int _private = 0;
  int _count = 0;
  int _collectionID = 0;

  @override
  void initState() {
    final state = BlocProvider.of<CollectionsBloc>(context).state;
    if (state is CollectionsLoadedState) {
      _setCollection(state.collection);
    }
    super.initState();
  }

  void _setCollection(CollectionEntity collection) {
    _title = collection.title;
    _imagePath = collection.logoPath;
    _private = collection.private;
    _count = collection.count;
    _collectionID = collection.id;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 300,
        color: ThemeColors.dialogBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _imagePath.isEmpty
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
                              image: FileImage(File(_imagePath)),
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
                        _title,
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
                          _private == 0
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
                            "$_count ${"collection.items".tr()}",
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
                  onPressed: () {
                    Routemaster.of(context).pop();
                    Routemaster.of(context).push("/$_collectionID/edit");
                  }),
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
                  BlocProvider.of<CollectionsBloc>(context).add(
                    CollectionsDeleteEvent(
                      id: _collectionID,
                    ),
                  );
                  Routemaster.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
