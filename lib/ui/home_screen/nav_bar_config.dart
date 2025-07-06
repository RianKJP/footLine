import 'package:flutter/material.dart';
import 'package:footline/ui/Painel_Permiss%C3%A3o/painel_permissao.dart';
import 'package:footline/ui/Perfil/Perfil_adm/perfil_screen.dart';
import 'package:footline/ui/cadastro_produtos/cadastro_produtos.dart';
import 'package:footline/ui/estoque_screen/estoque_screen.dart';
import 'package:footline/ui/home_screen/home_adm/home_adm.dart';
import 'package:footline/ui/relatorio_Desempenho/relatorio_desempenho.dart';
import 'package:footline/ui/widget/nav_bar_bottom.dart';

class NavBarConfig extends StatefulWidget {
  final int initialIndex;
  const NavBarConfig({super.key, this.initialIndex = 0});

  @override
  State<NavBarConfig> createState() => _NavBarConfigState();
}

class _NavBarConfigState extends State<NavBarConfig> {
  late int currentIndex;
  bool isTransitioning = false;

  final List<Widget> _pages = const [
    HomeAdm(),
    EstoqueScreen(),
    PerfilScreenADM(),
    PainelPermissaoScreen(),
    RelatorioLojaScreen(),
    CadastroProdutos(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex; // ← aqui está correto agora
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isTransitioning
            ? Container() // ou um loader
            : _pages[currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: NavBarBottom(
          activeIndex: currentIndex,
          onTap: (index) async {
            if (index != currentIndex && !isTransitioning) {
              setState(() {
                isTransitioning = true;
              });

              await Future.delayed(const Duration(milliseconds: 300));

              setState(() {
                currentIndex = index;
                isTransitioning = false;
              });
            }
          },
        ),
      ),
    );
  }
}
