import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:plazma/presentation/models/language_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final List<Language> items = Language.languages();

  String _language = "";
  String _title = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _language =
        EasyLocalization.of(context)?.currentLocale?.languageCode ?? "en";

    _title = EasyLocalization.of(context)?.currentLocale?.languageCode == "en"
        ? items[0].title
        : items[1].title;

    return SizedBox(
      height: 2.5.h,
      width: 22.w,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item.code,
                  child: Row(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ScalableImageWidget.fromSISource(
                              si: ScalableImageSource.fromSvg(
                                DefaultAssetBundle.of(context),
                                item.icon,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: 'KyivType',
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          value: _language,
          onChanged: (value) {
            setState(() {
              _language = value as String;
              context.setLocale(Locale(_language));
              final engine = WidgetsFlutterBinding.ensureInitialized();
              engine.performReassemble();
            });
          },
          customButton: Text(
            _title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.2),
              fontFamily: 'KyivType',
              fontWeight: FontWeight.w400,
              fontSize: 16.0.sp,
            ),
          ),
          buttonElevation: 2,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff1B1E2D),
          ),
          dropdownMaxHeight: 50.h,
          dropdownWidth: 40.w,
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      ),
    );
  }
}
