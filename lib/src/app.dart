import 'package:flutter/material.dart';
import 'package:jounerney/src/pages/client/home_screen.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeClient(),
    );
  }
}
