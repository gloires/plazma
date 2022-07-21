import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserName extends StatefulWidget {
  final String initValue;

  const UserName({Key? key, required this.initValue}) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  bool _isEditing = false;
  bool changed = false;
  TextEditingController? _nameController;

  @override
  void initState() {
    _nameController = TextEditingController()..text = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEditing = !_isEditing;
        });
      },
      child: TextFormField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        controller: _nameController,
        onChanged: (text) {
          setState(() {
            text == widget.initValue ? changed = false : changed = true;
          });
        },
        readOnly: _isEditing,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'KyivType',
            fontWeight: FontWeight.w300,
            fontSize: 18.0.sp),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: "settings.name".tr(),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
          suffix: changed
              ? const Icon(PhosphorIcons.check, color: Colors.white,) //TODO: save click | color
              : null,
        ),
      ),
    );
  }

  @override

  void dispose(){
    super.dispose();
    _nameController?.dispose();
  }
}
