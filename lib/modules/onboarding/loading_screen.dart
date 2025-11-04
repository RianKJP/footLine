import 'package:flutter/material.dart';
import 'package:footline/core/theme/app_colors.dart';
import 'package:footline/modules/login/login_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: Center(
          // tela inicial com um botão que muda de tela
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
          child: Image.asset(
            "./assets/img/logo3.png",
            fit: BoxFit.contain,
            width: 173,
          ),
        ),
      ),
    );
  }
}