import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:fuodz/widgets/menu_item.dart' as Menu;
import 'package:velocity_x/velocity_x.dart';

class AppLanguageSelector extends StatelessWidget {
  const AppLanguageSelector({this.onSelected, Key key}) : super(key: key);

  //
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: VStack(
        [
          //
          "Select your preferred language"
              .text
              .xl
              .semiBold
              .make()
              .py20()
              .px12(),

          //Arabic
          Menu.MenuItem(
            title: "Arabic",
            suffix: Flag.fromCode(FlagsCode.AE, height: 24, width: 24),
            onPressed: () => onSelected('ar'),
          ),
          //English
          Menu.MenuItem(
            title: "English",
            suffix: Flag.fromCode(FlagsCode.US, height: 24, width: 24),
            onPressed: () => onSelected('en'),
          ),
          //French
          Menu.MenuItem(
            title: "French",
            suffix: Flag.fromCode(FlagsCode.FR, height: 24, width: 24),
            onPressed: () => onSelected('fr'),
          ),
          //Spanish
          Menu.MenuItem(
            title: "Spanish",
            suffix: Flag.fromCode(FlagsCode.ES, height: 24, width: 24),
            onPressed: () => onSelected('es'),
          ),
          //German
          Menu.MenuItem(
            title: "German",
            suffix: Flag.fromCode(FlagsCode.DE, height: 24, width: 24),
            onPressed: () => onSelected('de'),
          ),
          //Portuguese
          Menu.MenuItem(
            title: "Portuguese",
            suffix: Flag.fromCode(FlagsCode.PT, height: 24, width: 24),
            onPressed: () => onSelected('pt'),
          ),
          //Korean
          Menu.MenuItem(
            title: "Korean",
            suffix: Flag.fromCode(FlagsCode.KR, height: 24, width: 24),
            onPressed: () => onSelected('ko'),
          ),

          //ADD YOUR CUSTOM LANGUAGE HERE
          // Menu.MenuItem(
          //   title: "LANGUAGE_NAME",
          //   suffix: Flag('COUNRTY_CODE', height: 24, width: 24),
          //   onPressed: () => onSelected('LANGUAGE_CODE'),
          // ),
        ],
      ).scrollVertical(),
    );
  }
}
