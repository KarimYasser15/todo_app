
import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppStyles {
  static TextStyle titleStyle = TextStyle(
      color: ColorsManager.white, fontSize: 22.sp, fontWeight: FontWeight.bold);
  static TextStyle selectedDateStyle = TextStyle(
    color: ColorsManager.primaryBlue,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle unSelectedDateStyle = TextStyle(
    color: ColorsManager.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle taskTitle = TextStyle(
    color: ColorsManager.primaryBlue,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle taskDescription = TextStyle(
    color: ColorsManager.black,
    fontSize: 12.sp,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle settingsBody = TextStyle(
    color: ColorsManager.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
}
