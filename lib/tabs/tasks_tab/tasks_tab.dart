import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:todo/tabs/tasks_tab/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;

    return Column(
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
                  "ToDo List",
                  style: Theme.of(context).textTheme.headlineLarge,
                ))),
            Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: SafeArea(
                child: EasyInfiniteDateTimeLine(
                  showTimelineHeader: false,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  focusDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  dayProps: EasyDayProps(
                    height: 79.h,
                    width: 58.w,
                    dayStructure: DayStructure.dayStrDayNum,
                    activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorsManager.white
                                    : ColorsManager.blackDark,
                            borderRadius: BorderRadius.circular(5.r)),
                        dayStrStyle: text.headlineMedium!.copyWith(color: ColorsManager.primaryBlue),
                        dayNumStyle: text.headlineMedium!.copyWith(color: ColorsManager.primaryBlue)),
                    inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? ColorsManager.white
                                    : ColorsManager.blackDark,
                            borderRadius: BorderRadius.circular(5.r)),
                        dayStrStyle:
                        text.headlineMedium,
                        dayNumStyle: text.headlineMedium),
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return TaskItem();
          },itemCount: 10,
          padding: EdgeInsets.only(top: 8.h),),
        )
      ],
    );
  }
}
