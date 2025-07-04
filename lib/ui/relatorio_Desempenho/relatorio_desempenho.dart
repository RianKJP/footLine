import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/widget/top_bar.dart'; // para gráfico de barras

class RelatorioLojaScreen extends StatelessWidget {
  const RelatorioLojaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(notificationCount: 2),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Sub app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back),
                Text(
                  "Relatórios da Loja",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.edit),
              ],
            ),
            const SizedBox(height: 16),

            const Text(
              "Destaques do mês",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Cartões de Destaque
            Row(
              children: const [
                Expanded(child: _DestaqueVendedor()),
                SizedBox(width: 12),
                Expanded(child: _DestaqueProduto()),
              ],
            ),

            const SizedBox(height: 24),

            // Gráfico Pizza
            Center(
              child:SizedBox(
              height: 180,
              width: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: CircularProgressIndicator(
                      strokeWidth: 50,
                      value: 0.6,
                      backgroundColor: AppColors.laranja,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.azulEscuro),
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

            const SizedBox(height: 55),

            SizedBox(
              child: Image.asset("./assets/img/container.png", width: 450,
                fit: BoxFit.none,)
            ),

            const SizedBox(height: 25),
            const Text("Melhores Vendedores", style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 12),
            const _VendedorItem(nome: "João", valor: "R\$ 18.300"),
            const _VendedorItem(nome: "Maria", valor: "R\$ 15.000"),
            const _VendedorItem(nome: "Pedro", valor: "R\$ 9.200"),

            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Exibir todos os vendedores"),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text("Exportar Relatório"),
              ),
            )
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
        children: const [
          Text("Vendedor que mais vendeu", style: TextStyle(fontSize: 12)),
          SizedBox(height: 8),
          CircleAvatar(radius: 20, backgroundColor: Colors.grey),
          SizedBox(height: 6),
          Text("Nome", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Total de Produtos: 20", style: TextStyle(fontSize: 12)),
          Text("Total em vendas: R\$ 10.000", style: TextStyle(fontSize: 12)),
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
        children: [
          const Text("Produto mais vendido", style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: Image.asset("assets/img/shoe.png", fit: BoxFit.contain),
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: const CircleAvatar(radius: 16, backgroundColor: Colors.black),
      title: Text(nome),
      trailing: Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
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
