import 'package:flutter/material.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key});

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.blue,
      onClosing: () {},
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.local_taxi_rounded,
                      size: 48,
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.motorcycle_rounded,
                      size: 48,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
