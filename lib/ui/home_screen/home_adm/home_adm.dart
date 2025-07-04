import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:footline/ui/_core/app_colors.dart';
import 'package:footline/ui/home_screen/nav_bar_config.dart';
import 'package:footline/ui/widget/top_bar.dart';

class HomeAdm extends StatefulWidget {
  const HomeAdm({super.key});

  @override
  State<HomeAdm> createState() => _HomeAdm();
}
void _mostrarAlertaEmDesenvolvimento(BuildContext context) {
  final TextEditingController _inputController = TextEditingController();

  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.bottomSlide,
    title: 'Em Desenvolvimento',
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Este recurso ainda está em fase de desenvolvimento.\n\nSe quiser visualizar assim mesmo, digite "ver mesmo assim" abaixo.',
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
    btnOkText: 'Continuar',
    btnOkColor: AppColors.azulEscuro,
    btnOkOnPress: () {
      if (_inputController.text.trim().toLowerCase() == 'ver mesmo assim') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NavBarConfig(initialIndex: 4,)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Digite corretamente para continuar.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    },
    btnCancelText: 'Cancelar',
    btnCancelOnPress: () {},
  ).show();
}


class _HomeAdm extends State<HomeAdm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TopBar(notificationCount: 2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, color: AppColors.azulEscuro),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Olá, Nome!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.azulEscuro,
                    ),
                  ),
                ],
              ),
            ),

            const Text(
              "Dados Administrativos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Cards com altura igual
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(child: _AdminCard(title: "Equipe Ativa", value: "10")),
                  SizedBox(width: 8),
                  Expanded(child: _AdminCard(title: "Pedidos de Acesso Pendentes", value: "2")),
                ],
              ),
            ),

            const SizedBox(height: 12),

            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(
                    child: _AdminCard(
                      title: "Comissão Total do Mês",
                      value: "R\$ 1.200,00",
                      isMoney: true,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(child: _AdminCard(title: "Total de Produtos Cadastrados", value: "150")),
                ],
              ),
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  side: const BorderSide(color: AppColors.azulEscuro, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                   _mostrarAlertaEmDesenvolvimento(context);
                },
                child: const Text(
                  "Relatórios de Desempenho",
                  style: TextStyle(
                    color: AppColors.azulEscuro,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

          const SizedBox(height: 36),
           Center(
              child:SizedBox(
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
    return Container(
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
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
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
