import 'package:flutter/material.dart';
import 'package:footline/core/theme/app_colors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return // evita sumiço em telas com notch
       Container(
        height: 80, // altura segura para logo e ícones
        decoration: const BoxDecoration(
          color: AppColors.azulEscuro,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo centralizada visualmente
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/img/logo3.png',
                  fit: BoxFit.cover,
                  width: 130, // ajuste conforme a imagem
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
