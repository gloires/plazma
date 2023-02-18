import 'dart:io';
import 'package:flutter/cupertino.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  final String image;

  const UserAvatar({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image.isEmpty
              ? const AssetImage("assets/images/avatar.png")
              : FileImage(File(image)) as ImageProvider,
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
