import 'package:flutter/material.dart';

class MainBottomSheetPage extends StatelessWidget {
  const MainBottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 193,
      duration: const Duration(),
      child: const Center(
        child: Text('바텀시트'),
      ),
    );
  }
}
