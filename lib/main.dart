import 'package:flutter/material.dart';
// import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/modules/onboarding/loading_screen.dart';

void main(List<String> args) {
  runApp(FootLine());
}
class FootLine extends StatelessWidget {
  const FootLine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      // home: NavBarConfig(),
    );
  }
}