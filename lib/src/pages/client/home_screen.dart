import 'package:flutter/material.dart';
import 'package:jounerney/src/pages/client/bottom_sheet.dart';
import 'package:jounerney/src/pages/client/home_drawer.dart';
import 'package:jounerney/src/pages/client/map_page.dart';

class HomeClient extends StatefulWidget {
  const HomeClient({super.key});

  @override
  State<HomeClient> createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journey'),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                size: 32,
              )),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_rounded, size: 48))
        ],
      ),
      drawer: const HomeDrawer(),
      body: const MapPage(),
      bottomSheet: const HomeBottomSheet(),
    );
  }
}
