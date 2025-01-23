import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/tabs/settings/settings_provider.dart';
import '../../core/utils/colors_manager.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsTab> {
  String languageSelected = "English";
  String modeSelected = "Light";

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 157.h,
              color: ColorsManager.primaryBlue,
            ),
            PositionedDirectional(
                start: 20.w,
                top: 20.h,
                child: SafeArea(
                    child: Text(
                  "Settings",
                  style: TextTheme.of(context).headlineLarge,
                ))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Language",
            style: text.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Container(
            width: 270,
            decoration: BoxDecoration(
                color: settingsProvider.themeMode == ThemeMode.dark
                    ? ColorsManager.blackDark
                    : ColorsManager.white,
                border: Border.all(
                  color: ColorsManager.primaryBlue,
                )),
            child: DropdownButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              isExpanded: true,
              iconEnabledColor: ColorsManager.primaryBlue,
              icon: Icon(Icons.keyboard_arrow_down),
              style: text.displayMedium!.copyWith(
                  color: ColorsManager.primaryBlue,
                  fontWeight: FontWeight.normal),
              underline: Container(
                color: Colors.transparent,
              ),
              value: languageSelected,
              items: ["English", "Arabic"].map((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  languageSelected = value!;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Light",
            style: text.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Container(
            width: 270,
            decoration: BoxDecoration(
                color: settingsProvider.themeMode == ThemeMode.dark
                    ? ColorsManager.blackDark
                    : ColorsManager.white,
                border: Border.all(
                  color: ColorsManager.primaryBlue,
                )),
            child: DropdownButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              isExpanded: true,
              iconEnabledColor: ColorsManager.primaryBlue,
              icon: Icon(Icons.keyboard_arrow_down),
              underline: Container(
                color: Colors.transparent,
              ),
              style: text.displayMedium!.copyWith(
                  color: ColorsManager.primaryBlue,
                  fontWeight: FontWeight.normal),
              value: settingsProvider.themeMode == ThemeMode.dark
                  ? "Dark"
                  : "Light",
              items: ["Light", "Dark"].map((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                settingsProvider.changeTheme(
                    value == "Dark" ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
        ),
      ],
    );
  }
}
