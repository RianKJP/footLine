import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';

class ConfirmacaoLoginAdm extends StatelessWidget {
  const ConfirmacaoLoginAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.branco,
      body: Stack(
        children: [
          // Fundo com duas cores
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(color: AppColors.branco),
              ),
              Expanded(
                child: Container(color: AppColors.verde),
              ),
            ],
          ),

          // Conteúdo sobreposto
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Image.asset(
                    'assets/img/ilustracao-conceito-chave.png',
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.verde,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Acesso liberado!",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.branco,
                            fontFamily: "Sora",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: const Text(
                          "Seu cadastro foi aprovado. Agora você já pode acessar todas as funcionalidades do FootLine.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.branco,
                            fontFamily: "Sora",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.azulEscuro,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const NavBarConfig();
                              }),
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: AppColors.branco,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
