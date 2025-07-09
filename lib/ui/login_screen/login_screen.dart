import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/ui/p%C3%B3s_login/confirma%C3%A7%C3%A3o_Adm/confirmacao_Adm.dart';
import 'package:quickalert/quickalert.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idControler = TextEditingController();
  bool _inputSenha = false;
  final idVendedor = '1122';

  @override
  void initState() {
    super.initState();
    _idControler.addListener(() {
      final idAdmin = _idControler.text.trim().toLowerCase() == 'admin';
      if (_inputSenha != idAdmin) {
        setState(() {
          _inputSenha = idAdmin;
        });
      }
    });
  }
  

  @override
  void dispose() {
    _idControler.dispose();
    super.dispose();
  }

void _mostrarAlertaNaoADM(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Erro',
    text: 'Id incorreto ou inexistente. ',
    confirmBtnText: 'Tentar Novamente',
    confirmBtnColor: AppColors.azulEscuro,
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.branco,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Image.asset(
                "./assets/img/logo_1.png",
                width: 170,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                "Faça login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppColors.azulEscuro,
                  fontFamily: "Sora",
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Faça login para acessar sua conta",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.azulEscuro,
                  fontFamily: "Sora",
                ),
              ),
              const SizedBox(height: 32),

              // Nome de usuário
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Digite seu nome de usuário',
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: AppColors.cinzaClaro,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.azulEscuro, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ID do vendedor
              TextFormField(
                controller: _idControler,
                decoration: InputDecoration(
                  hintText: 'Digite seu ID',
                  hintStyle: const TextStyle(color: Colors.black38),
                  filled: true,
                  fillColor: AppColors.cinzaClaro,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.azulEscuro, width: 2),
                  ),
                ),
              ),

              // Campo de senha condicional
              if (_inputSenha) ...[
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Digite sua senha de administrador',
                    hintStyle: const TextStyle(color: Colors.black45),
                    filled: true,
                    fillColor: AppColors.cinzaClaro,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.azulEscuro, width: 2),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Esqueceu seu ID?',
                  style: TextStyle(
                    color: AppColors.azulEscuro,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Sora",
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Botão Entrar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.azulEscuro,
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadowColor: Color(0xFFCBD6FF).withOpacity(0.9),
                    elevation: 6,
                  ),
                  onPressed: () {
                    if (_idControler.text.trim().toLowerCase() == 'admin') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfirmacaoLoginAdm(),
                        ),
                      );
                    }  else if (_idControler.text.trim().toLowerCase() == idVendedor) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavBarConfig(initialIndex: 0,isVendedor: true),
                        ),
                      );
                    } else {
                      _mostrarAlertaNaoADM(context);
                    }
                  },

                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Sora",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
