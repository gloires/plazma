import 'package:flutter/material.dart';

class UserAppVersion extends StatelessWidget {
  const UserAppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'App Version v1.1', //TODO: app ver
            style: TextStyle(
              color: Colors.white.withOpacity(0.2),
              fontFamily: 'KyivType',
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
