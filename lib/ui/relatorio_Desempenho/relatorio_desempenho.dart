import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/ui/widget/top_bar.dart';

class RelatorioLojaScreen extends StatelessWidget {
  const RelatorioLojaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Sub nav bar (de ponta a ponta e grudada)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NavBarConfig(initialIndex: 2),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Relatórios da Loja",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Destaques do mês",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            // Cartões de Destaque com altura igual
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                    child: SizedBox(height: 180, child: _DestaqueVendedor()),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(height: 180, child: _DestaqueProduto()),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Gráfico circular de meta
            Center(
              child: SizedBox(
                height: 230,
                width: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                      width: 180,
                      child: CircularProgressIndicator(
                        strokeWidth: 40,
                        value: 0.6,
                        backgroundColor: AppColors.laranja,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.azulEscuro),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "60%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "de\nmeta batida",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            Image.asset("assets/img/container.png", width: 450),

            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Melhores Vendedores",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            const _VendedorItem(nome: "João", valor: "R\$ 18.300"),
            const _VendedorItem(nome: "Maria", valor: "R\$ 15.000"),
            const _VendedorItem(nome: "Pedro", valor: "R\$ 9.200"),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                child: const Text("Exibir todos os vendedores"),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text("Exportar Relatório"),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _DestaqueVendedor extends StatelessWidget {
  const _DestaqueVendedor();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _boxStyle(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Vendedor Destaque", style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
         CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(Icons.person, color: AppColors.azulEscuro),
        ),
          const SizedBox(height: 6),
          const Text("Nome", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text("Total de Produtos: 20", style: TextStyle(fontSize: 12)),
          const Text("Total em vendas: R\$ 10.000", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _DestaqueProduto extends StatelessWidget {
  const _DestaqueProduto();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _boxStyle(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Produto mais vendido", style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: Image.asset("assets/img/puma 3.webp", fit: BoxFit.contain),
          ),
          const SizedBox(height: 6),
          const Text("Quantidade vendida: 20", style: TextStyle(fontSize: 12)),
          const Text("Total arrecadado: R\$ 30.000", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _VendedorItem extends StatelessWidget {
  final String nome;
  final String valor;

  const _VendedorItem({required this.nome, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalhesVendedorScreen(nome: nome),
            ),
          );
        },
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(Icons.person, color: AppColors.azulEscuro),
        ),
        title: Text(nome, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(valor),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 16),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetalhesVendedorScreen(nome: nome),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetalhesVendedorScreen extends StatelessWidget {
  final String nome;

  const DetalhesVendedorScreen({required this.nome, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de $nome'),
        backgroundColor: AppColors.azulEscuro,
      ),
      body: const Center(
        child: Text('Conteúdo detalhado do vendedor'),
      ),
    );
  }
}

BoxDecoration _boxStyle() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  );
}
