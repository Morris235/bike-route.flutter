import 'package:bike_route/main_bottom_sheet/view/main_bottom_sheet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FlutterMap(children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.bike_route.app',
              ),
            ]),
            const MainBottomSheetPage(),
          ],
        ),
      ),
    );
  }
}
