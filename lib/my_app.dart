import 'package:flutter/material.dart';
import 'package:todo/config/theme/app_theme.dart';
import 'package:todo/core/utils/routes_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 870),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesManager.home,
              onGenerateRoute: RoutesManager.router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
            ));
  }
}
