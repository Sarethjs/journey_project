import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Configuraciones',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 32,
                    ))
              ],
            ),
          ),
          const ListTile(
            title: Text('Texto'),
          ),
          const ListTile(
            title: Text('Texto'),
          ),
          const ListTile(
            title: Text('Texto'),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Modo conductor')),
        ],
      ),
    );
  }

  void closeDrawer() {}
}
