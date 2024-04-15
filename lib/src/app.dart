import 'package:flutter/material.dart';
import 'package:jounerney/src/pages/client/map_page.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeClient Screen',
      home: MapPage(),
    );
  }
}
