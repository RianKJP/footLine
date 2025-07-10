import 'dart:io';
import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/login_screen/login_screen.dart';
import 'package:footline/ui/widget/my_photo.dart';
import 'package:footline/ui/widget/top_bar.dart';
import 'package:image_picker/image_picker.dart';

class PerfilScreenVendedor extends StatefulWidget {
  const PerfilScreenVendedor({super.key});
    @override
  State<PerfilScreenVendedor> createState() => _PerfilScreenVendedorState();
}

class _PerfilScreenVendedorState extends State<PerfilScreenVendedor> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
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
                    "Nome do vendedor",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Vendedor",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
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
                  child: _ResumoBox(title: "Vendas esse mês", value: "0"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _ResumoBox(title: "Valor de comissões", value: "R\$ 0"),
                ),
              ],
            ),
            SizedBox(height: 20),
           const Align(
              alignment: Alignment.centerLeft,
              child: Text("Metas de Vendas",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Desempenho da Loja",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: _MetaBox(
                    title: "Vendas Realizadas",
                    value: "R\$ 0",
                    percent: "0%",
                    percentColor: Colors.green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _MetaBox(
                    title: "Meta de Vendas",
                    value: "R\$ 0",
                    percent: "0%",
                    percentColor: Colors.red,
                  ),
                ),
              ],
            ),

            SizedBox(height: 45),
            Row(
              children: [
                Expanded(child: botaoComIcone(Icons.bar_chart, "Estatística ")),// chama a funçao botaoComIcone e coloca os parametros
                SizedBox(width: 20),// espaço
                Expanded(child: botaoComIcone(Icons.money_off, "Comissões  ")),// chama a funçao botaoComIcone e coloca os parametros
                SizedBox(width: 20),// espaço
                Expanded(child: botaoComIcone(Icons.download, "Download")),// chama a funçao botaoComIcone e coloca os parametros
              ],
            ),

            SizedBox(height: 45),
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
                onPressed: () {},
                child: const Text("Ajuda/Suporte",style: TextStyle(color: AppColors.azulEscuro),),
              ),
            ),

            SizedBox(height: 17),
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
                child: const Text("Sair da Conta", style: TextStyle(color: AppColors.branco),
              ),
            ),
          ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}


//Função do botão com ícone
Widget botaoComIcone(IconData icone, String texto) {
  return Container(// retorna um container
    padding: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(//classe  usada para estilizar  um Container
      color: Colors.black,// cor
      borderRadius: BorderRadius.circular(8),// deixa redondo
    ),
    child: Column(// coluna
      children: [//  mais de um filho
        Icon(icone, color: Colors.cyanAccent, size: 30),
        SizedBox(height: 8),// espaço entre o icone e texto
        Text(texto, style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center),
      ],
    ),
  );
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