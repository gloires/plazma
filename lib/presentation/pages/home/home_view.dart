import 'package:plazma/presentation/pages/home/my_library_part.dart';
import 'package:plazma/presentation/pages/home/popular_part.dart';
import 'package:plazma/presentation/pages/home/user_part.dart';
import 'package:plazma/presentation/pages/home/watching_part.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              UserPart(),
              // PopularPart(),
              // WatchingPart(),
              // MyLibraryPart(),
            ],
          ),
        ),
      ),
    );
  }
}
