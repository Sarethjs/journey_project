import 'package:flutter/material.dart';
import 'package:jounerney/src/pages/client/map_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    );
  }
}
