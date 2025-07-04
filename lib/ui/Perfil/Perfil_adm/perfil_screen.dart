import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/ui/login_screen/login_screen.dart';
import 'package:footline/ui/widget/top_bar.dart';

class PerfilScreenADM extends StatelessWidget {
  const PerfilScreenADM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.branco,
      appBar: const TopBar(notificationCount: 2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Nome do Vendedor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("Vendedor", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Resumo do Vendedor
            const Text("Resumo do Vendedor",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87)),
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
            const Text("Metas de Vendas",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 4),
            const Text("Desempenho Atual",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavBarConfig(initialIndex: 4)),
                  );
                },
                child: const Text("Relatório de Desempenho"),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen()),
                  );
                },
                child: const Text("Sair da Conta"),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavBarConfig(initialIndex: 3)),
                  );
                },
                child: const Text("Painel de Permissão"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Box de resumo
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
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }
}

// Box de metas
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
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(percent,
              style: TextStyle(fontSize: 12, color: percentColor)),
        ],
      ),
    );
  }
}
