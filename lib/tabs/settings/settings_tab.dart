import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/tabs/settings/settings_provider.dart';
import '../../core/utils/colors_manager.dart';
import 'language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: "English", code: "en"),
    Language(name: "العربية", code: "ar")
  ];

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
                  AppLocalizations.of(context)!.settings,
                  style: TextTheme.of(context).headlineLarge,
                ))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            AppLocalizations.of(context)!.language,
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
            child: DropdownButton<Language>(
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
              value: languages.firstWhere((language) => language.code == settingsProvider.language),
              items: languages.map((language) {
                return DropdownMenuItem<Language>(
                  child: Text(language.name),
                  value: language,
                );
              }).toList(),
              onChanged: (value) {
                if(value != null)
                  {
                    settingsProvider.changeLanguage(value.code);
                  }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            AppLocalizations.of(context)!.mode,
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
                  ? AppLocalizations.of(context)!.dark
                  : AppLocalizations.of(context)!.light,
              items: [AppLocalizations.of(context)!.light, AppLocalizations.of(context)!.dark].map((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                settingsProvider.changeTheme(
                    value == AppLocalizations.of(context)!.dark ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
        ),
      ],
    );
  }
}
