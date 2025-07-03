import 'package:flutter/material.dart';
import 'package:footline/ui/estoque_screen/estoque_screen.dart';
import 'package:footline/ui/home_screen/home_adm/home_adm.dart';
import 'package:footline/ui/widget/nav_bar_bottom.dart';

class NavBarConfig extends StatefulWidget {
  const NavBarConfig({super.key});

  @override
  State<NavBarConfig> createState() => _NavBarConfigState();
}

class _NavBarConfigState extends State<NavBarConfig> {
    int currentIndex = 0;
  bool isTransitioning = false;

  final List<Widget> _pages = const [
    HomeAdm(),
    EstoqueScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isTransitioning
            ? Container() // ou um loader, se preferir
            : _pages[currentIndex],
        ),
        bottomNavigationBar: SafeArea(
        child: NavBarBottom(
          activeIndex: currentIndex,
          onTap: (index) async {
            if (index != currentIndex && !isTransitioning) {
              setState(() {
                isTransitioning = true;
              });

              await Future.delayed(const Duration(milliseconds: 300));

              setState(() {
                currentIndex = index;
                isTransitioning = false;
              });
            }
          },
        ),
      ),
    );
  }
}