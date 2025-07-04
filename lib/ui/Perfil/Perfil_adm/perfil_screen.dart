import 'dart:io';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/ui/login_screen/login_screen.dart';
import 'package:footline/ui/widget/my_photo.dart';
import 'package:footline/ui/widget/top_bar.dart';
import 'package:image_picker/image_picker.dart';

class PerfilScreenADM extends StatefulWidget {
  const PerfilScreenADM({super.key});

  @override
  State<PerfilScreenADM> createState() => _PerfilScreenADMState();
}

class _PerfilScreenADMState extends State<PerfilScreenADM> {
  File? _imagemPerfil;
  final MyPhoto _myPhoto = MyPhoto();

  void _alterarImagem() async {
    final imagemSelecionada =
        await _myPhoto.selecionarImagem(source: ImageSource.gallery);
    if (imagemSelecionada != null) {
      setState(() {
        _imagemPerfil = imagemSelecionada;
      });
    }
  }
void _mostrarAlertaEmDesenvolvimento(BuildContext context) {
  final TextEditingController _inputController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Em Desenvolvimento'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Este recurso ainda está em fase de desenvolvimento.\n\n'
              'Se quiser visualizar assim mesmo, digite "ver mesmo assim" abaixo.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite aqui',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar', style: TextStyle(color: AppColors.azulEscuro),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.azulEscuro,
            ),
            onPressed: () {
              final input = _inputController.text.trim().toLowerCase();
              Navigator.of(context).pop(); // Fecha o AlertDialog
              if (input == 'ver mesmo assim') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NavBarConfig(initialIndex: 4),
                  ),
                );
              } else {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  text: 'Digite corretamente para continuar.',
                  confirmBtnColor: Colors.red,
                );
              }
            },
            child: const Text('Continuar', style: TextStyle(color: AppColors.branco),),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.branco,
      appBar: const TopBar(notificationCount: 2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      GestureDetector(
                        onTap: _alterarImagem,
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: _imagemPerfil != null
                              ? FileImage(_imagemPerfil!)
                              : const AssetImage('assets/img/user pic.png')
                                  as ImageProvider,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 4, right: 4),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Nome do ADM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "ADM",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Resumo do Vendedor
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Resumo do Vendedor",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: _ResumoBox(title: "Vendas esse mês", value: "25"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ResumoBox(title: "Produtos vendidos", value: "30"),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Metas de Vendas
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Metas de Vendas",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Desempenho Atual",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: _MetaBox(
                    title: "Vendas Realizadas",
                    value: "R\$ 8.000",
                    percent: "+10%",
                    percentColor: Colors.green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MetaBox(
                    title: "Meta de Vendas",
                    value: "R\$ 10.000",
                    percent: "-20%",
                    percentColor: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Botões
            SizedBox(
              height: 45,
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.branco,
                  foregroundColor: AppColors.azulEscuro,
                  side: const BorderSide(color: AppColors.azulEscuro, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  _mostrarAlertaEmDesenvolvimento(context);
                },
                child: const Text("Relatório de Desempenho"),
              ),
            ),

            const SizedBox(height: 5),

            SizedBox(
              height: 45,
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.branco,
                   foregroundColor: AppColors.azulEscuro,
                  side: const BorderSide(color: AppColors.azulEscuro, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const NavBarConfig(initialIndex: 3)),
                  );
                },
                child: const Text("Painel de Permissão",style: TextStyle(color: AppColors.azulEscuro),),
              ),
            ),

            const SizedBox(height: 5),
           SizedBox(
            height: 45,
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.pretoEscuro,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text("Sair da Conta", style: TextStyle(color: Color.fromARGB(255, 243, 12, 12)),),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class _ResumoBox extends StatelessWidget {
  final String title;
  final String value;

  const _ResumoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
        ],
      ),
    );
  }
}

class _MetaBox extends StatelessWidget {
  final String title;
  final String value;
  final String percent;
  final Color percentColor;

  const _MetaBox({
    required this.title,
    required this.value,
    required this.percent,
    required this.percentColor,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          const SizedBox(height: 4),
          Text(percent,
              style: TextStyle(fontSize: 12, color: percentColor)),
        ],
      ),
    );
  }
}
