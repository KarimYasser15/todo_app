import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';

class TaskItem extends StatelessWidget {
  String taskTitle;
  String taskDescription;

  TaskItem({required this.taskTitle, required this.taskDescription});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    TextTheme text = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: brightness == Brightness.light
            ? ColorsManager.white
            : ColorsManager.blackDark,
      ),
      width: 352.w,
      height: 115.h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: ColorsManager.primaryBlue),
            margin: EdgeInsetsDirectional.only(end: 25.w),
            width: 4.w,
            height: 62.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  taskTitle,
                  style: text.bodyLarge,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  taskDescription,
                  style: text.bodyMedium,
                )
              ],
            ),
          ),
          Container(
              width: 69.w,
              height: 34.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorsManager.primaryBlue),
              child: Icon(
                Icons.check,
                size: 35.sp,
                color: ColorsManager.white,
              ))
        ],
      ),
    );
  }
}
