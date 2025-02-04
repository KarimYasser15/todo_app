import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    TextTheme text = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Slidable(
          closeOnScroll: true,
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseFunctions.deleteTaskFromFirestore(task.id).timeout(
                    Duration(milliseconds: 100),
                    onTimeout: () {
                      Provider.of<TasksProvider>(context, listen: false)
                          .getTasks();
                    },
                  ).catchError((error) => {print(error)});
                },
                backgroundColor: ColorsManager.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: AppLocalizations.of(context)!.delete,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r)),
              color: brightness == Brightness.light
                  ? ColorsManager.white
                  : ColorsManager.blackDark,
            ),
            width: double.infinity,
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
                        task.name,
                        style: text.bodyLarge,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        task.description,
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
          ),
        ),
      ),
    );
  }
}
