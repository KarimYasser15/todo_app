import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/tabs/settings/settings_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/tabs/tasks/add_task_bottom_sheet.dart';

import '../tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = const [TasksTab(), SettingsTab()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.w,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            elevation: 0,
            currentIndex: selectedIndex,
            onTap: (index) => setState(() {
                  selectedIndex = index;
                }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 30,
                  ),
                  label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  label: "Settings")
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => DefaultBottomSheet());
        },
        child: const Icon(
          Icons.add,
          color: ColorsManager.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
