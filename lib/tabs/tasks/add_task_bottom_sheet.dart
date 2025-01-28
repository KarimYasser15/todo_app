import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/tabs/settings/settings_provider.dart';
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
    return Container(
     // color: ColorsManager.white,
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.addNewTask,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10,
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
                height: 10,
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
                height: 20,
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
                height: 20,
              ),
              DefaultSubmitFormButton(
                  onPressed: () async{
                    if(formKey.currentState!.validate())
                      {
                        TaskModel task = TaskModel(name: taskName.text, description: taskDescription.text, date: selectedDate!);
                        await FirebaseFunctions.addTaskToFirestore(task);
                      }
                  },
                  label: "Add"),
            ],
          ),
        ),
      ),
    );
  }
}
