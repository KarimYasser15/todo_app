import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/tabs/settings/settings_provider.dart';

import 'my_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: MyApp()));
}
