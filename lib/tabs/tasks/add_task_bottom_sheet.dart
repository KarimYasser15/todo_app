import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/tabs/settings/settings_provider.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';
import 'package:todo/widgets/default_submit_form_button.dart';
import 'package:todo/widgets/default_text_form_field.dart';

import '../../models/task_model.dart';

class DefaultBottomSheet extends StatefulWidget {
  @override
  State<DefaultBottomSheet> createState() => _DefaultBottomSheetState();
}

DateTime? selectedDate = DateTime.now();
DateFormat dateFormatter = DateFormat.yMMMd();
TextEditingController taskName = TextEditingController();
TextEditingController taskDescription = TextEditingController();
var formKey = GlobalKey<FormState>();

class _DefaultBottomSheetState extends State<DefaultBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 360.h,
        decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15.r), right: Radius.circular(15.r))),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.addNewTask,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultTextFormField(
                  hintText: AppLocalizations.of(context)!.enterYourTask,
                  controller: taskName,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultTextFormField(
                    hintText: AppLocalizations.of(context)!.enterYourTaskDetails,
                    controller: taskDescription,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter a description";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: Text(
                    "Select Time\n${dateFormatter.format(selectedDate!)}",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  onTap: () async {
                    DateTime? dateTime = await showDatePicker(
                        context: context,
                        locale: Locale(settingsProvider.language),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        currentDate: selectedDate,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)));
                    if (dateTime != null && dateTime != selectedDate) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                DefaultSubmitFormButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        addTask();
                      }
                    },
                    label: "Add"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask() {
    TaskModel task = TaskModel(
        name: taskName.text,
        description: taskDescription.text,
        date: selectedDate!);
    FirebaseFunctions.addTaskToFirestore(task).timeout(
      Duration(microseconds: 100),
      onTimeout: () {
        Navigator.of(context).pop();
        Provider.of<TasksProvider>(context, listen: false).getTasks();
      },
    ).catchError(
      (error) {
        print(error);
      },
    );
  }
}
