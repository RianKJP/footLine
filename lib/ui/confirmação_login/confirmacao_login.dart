import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/home_adm/nav_bar_config.dart';

class ConfirmacaoLogin extends StatelessWidget {
  const ConfirmacaoLogin({super.key});

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
                          "Você está logado como Administrador",
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
                      const Text(
                        "Com esse acesso, você tem permissões adicionais, como:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.branco,
                          fontFamily: "Sora",
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("• Autorizar ou bloquear o acesso de funcionários",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.branco,
                                    fontFamily: "Sora")),
                            Text("• Cadastrar e editar produtos na plataforma",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.branco,
                                    fontFamily: "Sora")),
                            Text("• Visualizar relatórios de desempenho da equipe",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.branco,
                                    fontFamily: "Sora")),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Use essas funções para manter o controle e melhorar os resultados da sua operação.",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.branco,
                            fontFamily: "Sora",
                          ),
                          textAlign: TextAlign.center,
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
                      const SizedBox(height: 12),
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
