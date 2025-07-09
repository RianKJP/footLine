import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';

class AcessoNegado extends StatelessWidget {
  const AcessoNegado({super.key});

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
                    'assets/img/negado.jpg',
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.vermelho,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Acesso negado",
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
                      Align(
                        alignment: Alignment.center,
                        child:  
                          Text(
                          "Seu pedido de acesso foi recusado pelo administrador. Isso pode ter ocorrido por dados inválidos ou falta de autorização.",
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
                        child: Text(
                          "Revise suas informações ou entre em contato com o suporte para mais detalhes",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.branco,
                            fontFamily: "Sora",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
