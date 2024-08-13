import 'package:bike_route/main_bottom_sheet/view/main_bottom_sheet_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF333333),
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text('네비게이션 페이지'),
            ),
            MainBottomSheetPage(),
          ],
        ),
      ),
    );
  }
}
