import 'package:flutter/material.dart';
import 'package:footline/modules/home/nav_bar_config.dart';
import 'package:footline/core/widgets/visual/top_bar.dart';

class PainelPermissaoScreen extends StatefulWidget {
  const PainelPermissaoScreen({super.key});

  @override
  State<PainelPermissaoScreen> createState() => _PainelPermissaoScreenState();
}

class _PainelPermissaoScreenState extends State<PainelPermissaoScreen> {
  List<String> equipe = ["Carlos", "Joice", "Cabral", "Thiago"];
  List<String> pendentes = ["Pedro", "João"];
  bool modoEdicao = false;

  void aceitarConvite(String nome) {
    setState(() {
      pendentes.remove(nome);
      equipe.add(nome);
    });
  }

  void rejeitarConvite(String nome) {
    setState(() {
      pendentes.remove(nome);
    });
  }

  void removerMembro(String nome) {
    setState(() {
      equipe.remove(nome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      backgroundColor: Colors.white,
      body:SafeArea(
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Subnavbar com botão de edição
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
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
                              const NavBarConfig(initialIndex: 2,isVendedor: false,),
                        ),
                      );
                    },
                  ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Minha Equipe",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    modoEdicao ? Icons.close : Icons.edit,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      modoEdicao = !modoEdicao;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Lista de membros da equipe
          ...equipe.map((nome) => Container(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(nome),
                  trailing: modoEdicao
                      ? IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removerMembro(nome),
                        )
                      : null,
                ),
              )),

          const SizedBox(height: 24),

          // Título pedidos pendentes
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Pedidos Pendentes",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),

          // Lista de pendentes com ações
          ...pendentes.map((nome) => Container(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(nome),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check_circle, color: Colors.green),
                        onPressed: () => aceitarConvite(nome),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => rejeitarConvite(nome),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
