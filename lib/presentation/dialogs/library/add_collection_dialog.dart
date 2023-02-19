import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:plazma/presentation/widgets/library/collections_private_access.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routemaster/routemaster.dart';

class AddCollectionDialog extends StatefulWidget {
  const AddCollectionDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCollectionDialog> createState() => _AddCollectionDialogState();
}

class _AddCollectionDialogState extends State<AddCollectionDialog> {
  final FocusNode _nameNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _imagePath = "";

  int _selected = 0;

  @override
  void initState() {
    _nameNode.addListener(() {
      setState(() {});
    });
    _descriptionNode.addListener(() {
      setState(() {});
    });
    final state = BlocProvider.of<CollectionsBloc>(context).state;
    if (state is CollectionsLoadedState) {
      _setCollection(state.collection);
    }
    super.initState();
  }

  void _setCollection(CollectionEntity collection) {
    _nameController.text = collection.title;
    _descriptionController.text = collection.description;
    _imagePath = collection.logoPath;
    _selected = collection.private ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Dialog(
          backgroundColor: ThemeColors.dialogBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "library_tab.new_collection".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0.sp,
                        ),
                      ),
                      /*const Expanded(
                        child: SizedBox.shrink(),
                      ),
                      IconButton(
                        onPressed: () {
                          QR.back();
                        },
                        icon: Icon(
                          PhosphorIcons.xBold,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),*/ //TODO: check if close button is good
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ), //TODO: delete later
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        XFile? result = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(
                          () {
                            _imagePath = result!.path;
                          },
                        );
                      },
                      child: _imagePath.isEmpty
                          ? Container(
                              height: 90,
                              width: 90,
                              decoration: const BoxDecoration(
                                color: ThemeColors.collectionButton,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                PhosphorIcons.plus,
                                color: Colors.white,
                                size: 23.sp,
                              ),
                            )
                          : Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: ThemeColors.collectionButton,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(
                                    File(_imagePath),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ), //TODO: delete later
                  SizedBox(
                    height: 6.5.h,
                    child: TextField(
                      controller: _nameController,
                      focusNode: _nameNode,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'KyivType',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0.sp,
                      ),
                      decoration: InputDecoration(
                        labelText: "collection.name".tr(),
                        hintText: "collection.name_collection".tr(),
                        labelStyle: TextStyle(
                          color: _nameNode.hasFocus
                              ? ThemeColors.blueSelected
                              : ThemeColors.dialogHintColor,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0.sp,
                        ),
                        hintStyle: TextStyle(
                          color: ThemeColors.dialogHintColor.withOpacity(0.5),
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0.sp,
                        ),
                        border: _inputField(),
                        enabledBorder: _inputField(),
                        focusedBorder: _focusField(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ), //TODO: delete later
                  SizedBox(
                    height: 6.5.h,
                    child: TextField(
                      controller: _descriptionController,
                      focusNode: _descriptionNode,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'KyivType',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0.sp,
                      ),
                      decoration: InputDecoration(
                        labelText: "collection.description".tr(),
                        hintText: "collection.description".tr(),
                        labelStyle: TextStyle(
                          color: _descriptionNode.hasFocus
                              ? ThemeColors.blueSelected
                              : ThemeColors.dialogHintColor,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0.sp,
                        ),
                        hintStyle: TextStyle(
                          color: ThemeColors.dialogHintColor.withOpacity(0.5),
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0.sp,
                        ),
                        border: _inputField(),
                        enabledBorder: _inputField(),
                        focusedBorder: _focusField(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ), //TODO: delete later
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "collection.confidentiality".tr(),
                        style: TextStyle(
                          color: ThemeColors.dialogHintColor,
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ), //TODO: delete later
                      CollectionsPrivateAccess(
                        icon: PhosphorIcons.lockKey,
                        title: "collection.private".tr(),
                        subtitle: "collection.private_desc".tr(),
                        selected: _selected,
                        index: 0,
                        onPressed: () {
                          setState(() {
                            _selected = 0;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ), //TODO: delete later
                      CollectionsPrivateAccess(
                        icon: PhosphorIcons.link,
                        title: "collection.link".tr(),
                        subtitle: "collection.link_desc".tr(),
                        selected: _selected,
                        index: 1,
                        onPressed: () {
                          setState(() {
                            _selected = 1;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ), //TODO: delete later
                  Row(
                    children: [
                      const Expanded(
                        child: SizedBox.shrink(),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_nameController.text.isNotEmpty) {
                            BlocProvider.of<CollectionsBloc>(context).add(
                              CollectionsAddEvent(
                                name: _nameController.text,
                                description: _descriptionController.text,
                                private: _selected == 0
                                    ? true
                                    : false, //TODO: change bool to int
                                logoPath: _imagePath,
                              ),
                            );
                            Routemaster.of(context).pop();
                          }
                        },
                        child: Text(
                          "collection.create".tr(),
                          style: TextStyle(
                            color: _nameController.text.isEmpty
                                ? ThemeColors.dialogHintColor
                                : ThemeColors.blueSelected,
                            fontFamily: 'KyivType',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _inputField() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: ThemeColors.dialogHintColor,
          width: 1,
        ));
  }

  OutlineInputBorder _focusField() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: ThemeColors.blueSelected,
        width: 1,
      ),
    );
  }

  @override
  void dispose() {
    _nameNode.dispose();
    _descriptionNode.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
