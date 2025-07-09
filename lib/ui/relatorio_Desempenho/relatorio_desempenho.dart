import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
          children: [
            // Subnav bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
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
                              const NavBarConfig(initialIndex: 2, isVendedor: false),
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
              child: Text("Destaques do mês",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

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
                        value: 0.0,
                        backgroundColor: AppColors.laranja,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.azulEscuro),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "0%",
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

            // Gráfico funcional
            AspectRatio(
              aspectRatio: 1.5,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 20,
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            getTitlesWidget: (value, _) {
                              return Text('R\$ ${value.toInt()}k',
                                  style: TextStyle(fontSize: 10));
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, _) {
                              final meses = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul'];
                              return Text(meses[value.toInt()],
                                  style: TextStyle(fontSize: 10));
                            },
                          ),
                        ),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      gridData: FlGridData(show: true),
                      borderData: FlBorderData(show: false),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 18, color: Colors.grey)]),
                        BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 12, color: Colors.grey)]),
                        BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 9, color: Colors.grey)]),
                        BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 14, color: Colors.grey)]),
                        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 11, color: Colors.grey)]),
                        BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 16, color: Colors.grey)]),
                        BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 10, color: Colors.grey)]),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Melhores Vendedores",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            const _VendedorItem(nome: "João", valor: "R\$ 0"),
            const _VendedorItem(nome: "Maria", valor: "R\$ 0"),
            const _VendedorItem(nome: "Pedro", valor: "R\$ 0"),

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
                    MaterialPageRoute(
                      builder: (context) =>
                          const NavBarConfig(initialIndex: 3, isVendedor: false),
                    ),
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

// ------------------ COMPONENTES ------------------------

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
          const Text("Total de Produtos: 0", style: TextStyle(fontSize: 12)),
          const Text("Total em vendas: R\$ 0", style: TextStyle(fontSize: 12)),
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
          const Text("Quantidade vendida: 0", style: TextStyle(fontSize: 12)),
          const Text("Total arrecadado: R\$ 0", style: TextStyle(fontSize: 12)),
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
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
