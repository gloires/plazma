import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/presentation/bloc/collections/collections_bloc.dart';
import 'package:plazma/presentation/dialogs/library/add_collection_dialog.dart';
import 'package:plazma/presentation/pages/library/library_main_part/library_collections_custom_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LibraryCollections extends StatefulWidget {
  const LibraryCollections({Key? key}) : super(key: key);

  @override
  State<LibraryCollections> createState() => _LibraryCollectionsState();
}

class _LibraryCollectionsState extends State<LibraryCollections> {
  final double _collectionSize = 35.sp;

  @override
  Widget build(BuildContext context) {
    final collectionsBloc = BlocProvider.of<CollectionsBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Text(
            "library_tab.my_collections".tr(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'KyivType',
              fontWeight: FontWeight.w500,
              fontSize: 18.0.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            // barrierDismissible: false, //TODO: check if close button is good
            builder: (BuildContext context) => AddCollectionDialog(
              collectionsBloc: collectionsBloc,
            ),
          ),
          child: Row(
            children: [
              Container(
                height: _collectionSize,
                width: _collectionSize,
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
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "library_tab.new_collection".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'KyivType',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0.sp,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<CollectionsBloc, CollectionsState>(
          buildWhen: (previous, current) {
            return (current is CollectionsListLoadedState ||
                current is CollectionsEmptyState);
          },
          builder: (BuildContext context, state) {
            if (state is CollectionsListLoadedState) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.collections.length,
                itemBuilder: (context, itemPosition) {
                  CollectionEntity collection = state.collections[itemPosition];
                  return LibraryCollectionsCustomItem(
                    collection: collection,
                    size: _collectionSize,
                  );
                },
              );
            }
            return Center(); //TODO: empty list
          },
        ),
      ],
    );
  }
}
