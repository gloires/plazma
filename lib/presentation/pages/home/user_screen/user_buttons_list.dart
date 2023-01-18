import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plazma/presentation/widgets/language_dropdown.dart';
import 'package:plazma/presentation/widgets/user/user_button.dart';

class UserButtonsList extends StatelessWidget {
  const UserButtonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UserButton(
          trailing: LanguageDropdown(),
          primaryShadow: Color.fromRGBO(65, 44, 194, 0.57),
          secondaryShadow: Color.fromRGBO(34, 36, 51, 1),
          primaryLinear: Color.fromRGBO(2, 149, 219, 1),
          secondaryLinear: Color.fromRGBO(187, 46, 236, 1),
          icon: PhosphorIcons.globeLight,
          title: "settings.language",
        ),
        UserButton(
          primaryShadow: Color.fromRGBO(44, 194, 140, 0.57),
          secondaryShadow: Color.fromRGBO(34, 36, 51, 1),
          primaryLinear: Color.fromRGBO(137, 219, 2, 1),
          secondaryLinear: Color.fromRGBO(46, 202, 236, 1),
          icon: PhosphorIcons.lockSimpleLight,
          title: "settings.privacy",
        ),
        UserButton(
          primaryShadow: Color.fromRGBO(44, 59, 194, 0.57),
          secondaryShadow: Color.fromRGBO(34, 36, 51, 1),
          primaryLinear: Color.fromRGBO(2, 50, 219, 1),
          secondaryLinear: Color.fromRGBO(46, 168, 236, 1),
          icon: PhosphorIcons.chatsTeardropLight,
          title: "settings.help",
        ),
        UserButton(
          primaryShadow: Color.fromRGBO(194, 116, 44, 0.57),
          secondaryShadow: Color.fromRGBO(34, 36, 51, 1),
          primaryLinear: Color.fromRGBO(219, 197, 2, 1),
          secondaryLinear: Color.fromRGBO(236, 80, 46, 1),
          icon: PhosphorIcons.infoLight,
          title: "settings.about",
        ),
      ],
    );
  }
}
