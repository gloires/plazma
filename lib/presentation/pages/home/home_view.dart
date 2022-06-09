import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/core/theme/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? _greeting;

  @override
  void initState() {
    getCurrentTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool notification = true; //TODO: notification calendar

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        //TODO: size
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _greeting!,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'KyivType',
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0),
                    ),
                    const Text("User A.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'KyivType',
                            fontWeight: FontWeight.w300,
                            fontSize: 18.0))
                  ],
                ),
                const Expanded(child: SizedBox.shrink()),
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          PhosphorIcons.bellSimple,
                          color: Colors.white,
                          size: 30,
                        )),
                    SizedBox(
                      height: 30,
                      width: 37,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: notification
                                  ? ThemeColors.blueSelected
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getCurrentTime() {
    DateTime now = DateTime.now();
    if (now.hour >= 24 && now.hour < 12) {
      _greeting = "Good Morning,"; //TODO: text
    } else if (now.hour >= 12 && now.hour < 16) {
      _greeting = "Good Afternoon,";
    } else if (now.hour >= 16 && now.hour < 24) {
      _greeting = "Good Evening,";
    }
  }
}
