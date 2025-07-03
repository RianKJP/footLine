import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:footline/ui/_core/app_colors.dart'; // ← usa suas cores

class NavBarBottom extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;

  const NavBarBottom({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.azulEscuro,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SalomonBottomBar(
        backgroundColor: Colors.transparent,
        currentIndex: activeIndex,
        onTap: onTap,
        selectedItemColor: AppColors.branco,
        unselectedItemColor: Colors.white70,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: AppColors.branco,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.dashboard),
            title: Text("Painel"),
            selectedColor: AppColors.branco,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Perfil"),
            selectedColor: AppColors.branco,
          ),
        ],
      ),
    );
  }
}
