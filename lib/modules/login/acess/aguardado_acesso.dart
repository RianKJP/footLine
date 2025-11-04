import 'package:flutter/material.dart';
import 'package:footline/core/theme/app_colors.dart';

class AguardadoAcesso extends StatelessWidget {
  const AguardadoAcesso({super.key});

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
                child: Container(color: AppColors.azulEscuro),
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
                    'assets/img/pensativa.jpg',
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.azulEscuro,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Aguardando liberação do administrador",
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
                          "Seu acesso está sendo analisado. Assim que for aprovado, você poderá usar o app normalmente.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.branco,
                            fontFamily: "Sora",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child:  Text(
                          "Se isso demorar mais de 24h,\n entre em contato com o suporte.",
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
