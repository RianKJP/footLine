import 'package:flutter/material.dart';
import 'package:footline/ui/widget/top_bar.dart';

class HomeAdm extends StatelessWidget {
  const HomeAdm({super.key});

  @override
  Widget build(BuildContext context) {

    final primaryColor = Color(0xFF0F1624); 
    final orangeColor = Color(0xFFFBAF18); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(notificationCount: 2),
      body:Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, Nome!",
                  style: TextStyle(color: primaryColor),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              children: [
                const Text(
                  "Dados Administrativos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _AdminCard(title: "Equipe Ativa", value: "10"),
                    _AdminCard(title: "Pedidos de Acesso Pendentes", value: "2"),
                  ],
                ),
          
                const SizedBox(height: 12),
          

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _AdminCard(
                        title: "Comissão Total do Mês", value: "R\$ 1.200,00", isMoney: true),
                    _AdminCard(title: "Total de Produtos Cadastrados", value: "150"),
                  ],
                ),
          
                const SizedBox(height: 16),

                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Relatórios de Desempenho"),
                  ),
                ),
          
                const SizedBox(height: 24),

                SizedBox(
                  height: 180,
                  width: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 180,
                        width: 180,
                        child: CircularProgressIndicator(
                          strokeWidth: 25,
                          value: 0.6,
                          backgroundColor: orangeColor,
                          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
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
          
                const SizedBox(height: 32),

                const Text(
                  "Atividades Recentes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
          
                const SizedBox(height: 8),
          

                Column(
                  children: const [
                    RecentActivityItem(
                      icon: Icons.add_box,
                      title: "Novo produto adicionado",
                      subtitle: "Tênis AirMax",
                      time: "Hoje às 14:22",
                    ),
                    RecentActivityItem(
                      icon: Icons.access_alarm_outlined,
                      title: "Solicitação de acesso",
                      subtitle: "João Silva",
                      time: "Ontem às 09:15",
                    ),
                    RecentActivityItem(
                      icon: Icons.shopping_cart,
                      title: "Venda - Vendedor Joao",
                      subtitle: "R\$ 739,00",
                      time: "Ontem às 16:45",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AdminCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isMoney;

  const _AdminCard({
    required this.title,
    required this.value,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 6),
            Text(
              isMoney ? value : value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isMoney ? Colors.black87 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget item atividade recente
class RecentActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  const RecentActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 24, color: Colors.black54),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
