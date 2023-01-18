import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/presentation/bloc/user/user_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserName extends StatefulWidget {
  final String initValue;
  final UserBloc userBloc;

  const UserName({
    Key? key,
    required this.initValue,
    required this.userBloc,
  }) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          _nameController.text = state.user.name;
        }
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
            onFieldSubmitted: (name){
              widget.userBloc.add(UserEditEvent(name: name));
            },
            readOnly: _isEditing,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'KyivType',
                fontWeight: FontWeight.w300,
                fontSize: 18.0.sp),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
              hintText: "settings.name".tr(),
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }
}
