import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/theme/app_theme.dart';
import 'package:todo/core/utils/routes_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/tabs/settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(settingsProvider.language),
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesManager.home,
              onGenerateRoute: RoutesManager.router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: settingsProvider.themeMode,
            ));
  }
}
