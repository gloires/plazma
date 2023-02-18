import 'package:flutter/material.dart';
import 'package:plazma/presentation/pages/library/library_main_part/library_app_bar.dart';
import 'package:plazma/presentation/pages/library/library_main_part/library_collections.dart';
import 'package:plazma/presentation/pages/library/library_main_part/library_genre_list.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: SingleChildScrollView( //TODO: change singlechild like only list can move
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LibraryAppBar(),
                LibraryGenreList(),
                LibraryCollections(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}