import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;

  const TopBar({super.key, this.notificationCount = 0});

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
            const SizedBox(width: 24), // espaçamento à esquerda

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

            // Ícone com contador
            Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 30,
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        '+$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
